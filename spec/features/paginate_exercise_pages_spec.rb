require 'rails_helper'

describe "the exercise paginating process" do
  it "paginates exercises" do
    user = FactoryGirl.create(:user)
    10.times { FactoryGirl.create(:exercise, :user_id => user.id) }
    visit user_path(user)
    expect(page).to have_selector :css, 'div .pagination'
  end

  it "shows multiple pages if there are more than 5 exercises" do
    user = FactoryGirl.create(:user)
    15.times { FactoryGirl.create(:exercise, :user_id => user.id) }
    visit user_path(user)
    expect(page).to have_content '3'
  end
end
