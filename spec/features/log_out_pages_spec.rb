require 'rails_helper'

describe "the log out process" do
  it "logs a user out" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'tfabery@gmail.com'
    fill_in 'Password', :with => 'ilovenike'
    click_button 'Log in'
    click_link 'Logout'
    expect(page).to have_content 'Signed out successfully.'
  end
end
