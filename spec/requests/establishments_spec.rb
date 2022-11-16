require 'rails_helper'

RSpec.describe 'Establishments', type: :request do
  before :each do
    @user = User.create(name: 'Vitor Guedes', email: 'success@example.com', password: 'password',
                        password_confirmation: 'password')
    @group = Group.create(name: 'Movies', icon: 'Movie-image', user: @user)
    @establishment = Establishment.create(name: 'Avengers', amount: 100, user: @user)
    @establishment.groups << @group
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get group_establishments_path(@group)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get group_establishment_path(@group, @establishment)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_group_establishment_path(@group)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_group_establishment_path(@group, @establishment)
      expect(response).to be_successful
    end
  end
end
