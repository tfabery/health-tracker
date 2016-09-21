class FoodsController < ApplicationController
  def show
    @food = Food.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @food = @user.foods.new
  end

  def create
    @user = User.find(params[:user_id])
    @foods = @user.foods
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
