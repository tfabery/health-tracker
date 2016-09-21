require 'rails_helper'

describe "the sign up process" do
  it "creates a new user" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'tonythetiger@hotmail.com'
    fill_in 'Password', :with => 'iamtonythetiger'
    fill_in 'Password confirmation', :with => 'iamtonythetiger'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
