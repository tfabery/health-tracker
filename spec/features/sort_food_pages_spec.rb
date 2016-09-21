require 'rails_helper'

describe "the sorting food by name process" do
  it "sorts foods by name ascending" do
    user = FactoryGirl.create(:user)
    food = FactoryGirl.create(:food, :user_id=>user.id)
    food2 = FactoryGirl.create(:food, :name=> 'spam', :user_id=>user.id)
    visit user_path(user)
    click_link 'Sort By Name'
    expect(food.name).to appear_before(food2.name)
  end

  it "sorts foods by name descending" do
    user = FactoryGirl.create(:user)
    food = FactoryGirl.create(:food, :user_id=>user.id)
    food2 = FactoryGirl.create(:food, :name=> 'spam', :user_id=>user.id)
    visit user_path(user)
    click_link 'Sort By Name'
    click_link 'Sort By Name'
    expect(food2.name).to appear_before(food.name)
  end

  it "sorts foods by calories ascending" do
    user = FactoryGirl.create(:user)
    food = FactoryGirl.create(:food, :user_id=>user.id)
    food2 = FactoryGirl.create(:food, :name=>'spam', :calories=> '566', :user_id=>user.id)
    visit user_path(user)
    click_link 'Sort By Calories'
    expect(food.name).to appear_before(food2.name)
  end

  it "sorts foods by name descending" do
    user = FactoryGirl.create(:user)
    food = FactoryGirl.create(:food, :user_id=>user.id)
    food2 = FactoryGirl.create(:food, :name=> 'spam', :calories=> '566', :user_id=>user.id)
    visit user_path(user)
    click_link 'Sort By Calories'
    click_link 'Sort By Calories'
    expect(food2.name).to appear_before(food.name)
  end
end
