require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  before :each do
    @user = User.create(name: 'Vitor Guedes', email: 'success@example.com', password: 'password', password_confirmation: 'password')
    sign_in @user
    visit root_path
  end

  it 'Check homepage content' do
    expect(page.body).to include('Settings')
    expect(page.body).to include('Log out')
    expect(page.body).to include('New group')
    expect(page.body).to include('Most recent')
  end

  it 'Creating new group' do
    click_link 'New group'
    expect(page).to have_content 'Back to groups'
    expect(page).to have_content '🎲'
    fill_in 'group_name', with: 'Sports'
    click_button 'Create Group'
    expect(page).to have_content 'Group was successfully created.'
  end
end
