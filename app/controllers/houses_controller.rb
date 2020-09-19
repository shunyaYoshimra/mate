class HousesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_house, only: [:show, :update]
  def index
    @q = House.ransack(params[:q])
    @houses = @q.result(distinct: true)
  end

  def show
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    if @house.save
      @house.users << current_user
      redirect_to @house, notice: 'あなたのシェアハウスを設定しました。'
    else
      render :new
    end
  end

  def update
    if @house.update(house_params)
      redirect_to @house, notice: 'シェアハウスの情報を更新しました。'
    else
      render :show
    end
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:name, :profile, :prefecture, pictures: [], user_ids: [])
  end
end
