class FoodsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @food = @user.foods.new
  end

  def create
    @user = User.find(params[:user_id])
    @foods = @user.foods.paginate(:page => params[:food_paginate], :per_page => 5)
    @exercises = @user.exercises.paginate(:page => params[:exercise_paginate], :per_page => 5)
    @food = @user.foods.new(food_params)
    if @food.save
      flash[:success] = 'Food Entry Created'
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    else
      flash[:error] = 'Food Unable To Be Saved'
      redirect_to user_path(@user)
    end
  end

  private
    def food_params
      params.require(:food).permit(:name, :calories)
    end
end
