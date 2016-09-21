require 'rails_helper'

describe "the sorting exercise by name process" do
  it "sorts exercises by name ascending" do
    user = FactoryGirl.create(:user)
    exercise = FactoryGirl.create(:exercise, :user_id=>user.id)
    exercise2 = FactoryGirl.create(:exercise, :name=> 'sit', :user_id=>user.id)
    visit user_path(user)
    click_link 'Sort By Name'
    expect(exercise.name).to appear_before(exercise2.name)
  end

  it "sorts exercises by name descending" do
    user = FactoryGirl.create(:user)
    exercise = FactoryGirl.create(:exercise, :user_id=>user.id)
    exercise2 = FactoryGirl.create(:exercise, :name=> 'sit', :user_id=>user.id)
    visit user_path(user)
    click_link 'Sort By Name'
    click_link 'Sort By Name'
    expect(exercise2.name).to appear_before(exercise.name)
  end

  it "sorts exercises by calories ascending" do
    user = FactoryGirl.create(:user)
    exercise = FactoryGirl.create(:exercise, :user_id=>user.id)
    exercise2 = FactoryGirl.create(:exercise, :name=>'squat', :calories=> '566', :user_id=>user.id)
    visit user_path(user)
    click_link 'Sort By Calories'
    expect(exercise.name).to appear_before(exercise2.name)
  end

  it "sorts exercises by name descending" do
    user = FactoryGirl.create(:user)
    exercise = FactoryGirl.create(:exercise, :user_id=>user.id)
    exercise2 = FactoryGirl.create(:exercise, :name=> 'squat', :calories=> '566', :user_id=>user.id)
    visit user_path(user)
    click_link 'Sort By Calories'
    click_link 'Sort By Calories'
    expect(exercise2.name).to appear_before(exercise.name)
  end
end
