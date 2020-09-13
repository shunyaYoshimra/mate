class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    profile = current_user.build_profile(profile_params)
    if profile.save
      redirect_to profile, notice: '自己紹介しました。'
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
      render :edit
    end
  end

  def destroy
    @profile.destroy
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:profile, :image, :avatar)
  end
end
