class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private 

  def user_params 
    params.require(:user).permit(
      :name,
      :profile,
      :age,
      :height,
      :weight,
      :body_fat_percentage
    )
  end
end
