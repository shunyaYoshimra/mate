class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
    @currentUserEntries = Entry.where(user_id: current_user.id)
    @userEntries = Entry.where(user_id: @profile.user.id)
    unless current_user == @profile.user
      @currentUserEntries.each do |ce|
        @userEntries.each do |ue|
          if ce.room_id == ue.room_id
            @isRoom = true
            @roomId = ce.room
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to @profile, notice: '自己紹介しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'プロフィールを編集しました。'
    else
      render :show
    end
  end

  def destroy
    @profile.destroy
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end 

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:profile, :image, :avatar)
  end
end
