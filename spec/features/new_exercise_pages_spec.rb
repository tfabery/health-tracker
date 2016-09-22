require 'rails_helper'

describe "the new exercise creating process" do
  it "creates a new exercise" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'tfabery@gmail.com'
    fill_in 'Password', :with => 'ilovenike'
    click_button 'Log in'
    click_link 'Add Exercise'
    fill_in 'Name', :with => 'Running'
    fill_in 'Calories', :with => '50'
    click_button 'Create Exercise'
    expect(page).to have_content 'Running'
  end

  it "errors without creating a new exercise when no values are submitted" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'tfabery@gmail.com'
    fill_in 'Password', :with => 'ilovenike'
    click_button 'Log in'
    click_link 'Add Exercise'
    click_button 'Create Exercise'
    expect(page).to have_content 'Exercise Unable To Be Saved'
  end
end
