class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if params[:exercise_sort] && params[:direction] || params[:search]
      @exercises = @user.exercises.order(params[:exercise_sort] + " " + params[:direction]).paginate(:page => params[:exercise_paginate], :per_page => 5)
    else
      @exercises = @user.exercises.paginate(:page => params[:exercise_paginate], :per_page => 5)
    end
    if params[:food_sort] && params[:direction] || params[:search]
      @foods = @user.foods.order(params[:food_sort] + " " + params[:direction]).paginate(:page => params[:food_paginate], :per_page => 5)
    else
      @foods = @user.foods.paginate(:page => params[:food_paginate], :per_page => 5)
    end
  end
end
