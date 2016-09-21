class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if params[:exercise_sort] && params[:direction]
      @exercises = @user.exercises.order(params[:exercise_sort] + " " + params[:direction])
    else
      @exercises = @user.exercises
    end

    if params[:food_sort] && params[:direction]
      @foods = @user.foods.order(params[:food_sort] + " " + params[:direction])
    else
      @foods = @user.foods
    end
  end
end
