class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :foods, dependent: :destroy
  has_many :exercises, dependent: :destroy

  def food_calories
    total = 0
    self.foods.each do |food|
      total += food.calories
    end
    return total
  end

  def exercise_calories
    total = 0
    self.exercises.each do |exercise|
      total += exercise.calories
    end
    return total
  end

  def total_calories
    return self.food_calories - self.exercise_calories
  end
end
