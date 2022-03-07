class MealRecordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ] 
  before_action :set_meal_record, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]


  def index
    @meal_records = MealRecords.includes(:user).order("created_at DESC")
    meal_record = MealRecord.find(params[:id])
  end

  def new
    @meal_record = MealRecord.new
  end

  def create
    @meal_record = MealRecord.new(meal_record_params)
    if @meal_record.save
      redirect_to user_path
    else
      render :new
    end
  end

  def show
    @meal_record = MealRecord.find(params[:id])
  end

  def destroy
    meal_record = MealRecord.find(params[:id])
    meal_record.destroy
  end

  private

  def meal_record_params
    params.require(:meal_record).permit(:text, :calorie, :image).merge(user_id: current_user.id )
  end

  def set_meal_record
    @meal_records = MealRecord.find(meal_record_params)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
