class BodyMakesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ] 
  before_action :set_body_make, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]


  def index
    @body_makes = BodyMakes.includes(:user).order("created_at DESC")
    body_make = BodyMake.find(params[:id])
  end

  def new
    @body_make = BodyMake.new
  end

  def create
    @body_make = BodyMake.new(body_make_params)
    if @body_make.save
      redirect_to user_path
    else
      render :new
    end
  end

  def show
    @body_make = BodyMake.find(params[:id])

  end

  def destroy
    body_make = BodyMake.find(params[:id])
    body_make.destroy
  end

  private

  def body_make_params
    params.require(:body_make).permit(:text, :calorie, :image).merge(user_id: current_user.id )
  end

  def set_body_make
    @body_makes = BodyMake.find(body_make_params)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
