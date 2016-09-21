require 'rails_helper'

describe "the log in process" do
  it "logs a user in" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'tfabery@gmail.com'
    fill_in 'Password', :with => 'ilovenike'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end
