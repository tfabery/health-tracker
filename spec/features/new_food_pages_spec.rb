require 'rails_helper'

describe "the new food creating process" do
  it "creates a new food" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'tfabery@gmail.com'
    fill_in 'Password', :with => 'ilovenike'
    click_button 'Log in'
    click_link 'Add Food :D'
    fill_in 'Name', :with => 'Toast'
    fill_in 'Calories', :with => '5'
    click_button 'Create Food'
    expect(page).to have_content 'Toast'
  end

  it "errors without creating a new food when no values are submitted" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'tfabery@gmail.com'
    fill_in 'Password', :with => 'ilovenike'
    click_button 'Log in'
    click_link 'Add Food :D'
    click_button 'Create Food'
    expect(page).to have_content 'Food Unable To Be Saved'
  end
end
