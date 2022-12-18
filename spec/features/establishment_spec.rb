require 'rails_helper'

RSpec.feature 'Establishments', type: :feature do
  before :each do
    @user = User.create(name: 'Vitor Guedes', email: 'success@example.com', password: 'password',
                        password_confirmation: 'password')
    @group = Group.create(name: 'Sports', icon: '🎲', user: @user)
    sign_in @user
    visit root_path
  end

  it 'Creating new establishment' do
    visit "groups/#{@group.id}/establishments"
    click_link 'New establishment'
    expect(page).to have_content 'Back to establishments'
    expect(page).to have_content '🎲'
    fill_in 'establishment_name', with: 'CrossFit'
    fill_in 'establishment_amount', with: 100
    click_button 'Create Establishment'
    expect(page).to have_content 'Establishment was successfully created.'
    click_link 'Back to groups'
    expect(page).to have_content 'Groups'
  end
end
