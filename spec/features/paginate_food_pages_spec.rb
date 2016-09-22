require 'rails_helper'

describe "the food paginating process" do
  it "paginates foods" do
    user = FactoryGirl.create(:user)
    10.times { FactoryGirl.create(:food, :user_id => user.id) }
    visit user_path(user)
    expect(page).to have_selector :css, 'div .pagination'
  end

  it "shows multiple pages if there are more than 5 foods" do
    user = FactoryGirl.create(:user)
    10.times { FactoryGirl.create(:food, :user_id => user.id) }
    visit user_path(user)
    expect(page).to have_content '2'
  end
end
