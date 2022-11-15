require 'rails_helper'

RSpec.feature 'UserSignIn', type: :feature do
  before :each do
    @user = User.create(name: 'Vitor Guedes', email: 'success@example.com', password: 'password', password_confirmation: 'password')
  end

  it 'signs me in' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: 'success@example.com'
      fill_in 'user_password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Groups'
  end

  it 'should not sign me in' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: 'fail@example.com'
      fill_in 'user_password', with: 'failpassword'
    end
    click_button 'Log in'
    expect(page).to have_content 'Remember me'
  end
end
