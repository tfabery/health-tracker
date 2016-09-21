class ExercisesController < ApplicationController
  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @exercise = @user.exercises.new
  end

  def create
    @user = User.find(params[:user_id])
    @exercise = @user.exercises.new(exercise_params)

    if @exercise.save
      flash[:notice] = 'Exercise Entry Created'
      respond_to do |format|
        format.html { redirect_to new_user_exercise_path }
        format.js
      end
    else
      render :new
    end
  end

  private
    def exercise_params
      params.require(:exercise).permit(:name, :calories)
    end
end
