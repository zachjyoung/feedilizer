require 'spec_helper'

feature 'User can register a account', %Q{
  As a User
  I want to register 
  So I can create a feed
}do 

let(:user) { FactoryGirl.build(:user) }

  scenario 'new user signs up from the front page with valid email' do 
    visit root_path
    click_on 'Sign up'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'new user signs up from the front page with valid email' do 
    visit root_path
    click_on 'Sign up'
    click_button 'Sign up'
    expect(page).to have_content("Email can't be blank")
  end

end
