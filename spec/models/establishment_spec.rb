require 'rails_helper'

RSpec.describe Establishment, type: :model do
  before do
    @user = User.create(name: 'Vitor Guedes', email: 'test@example.com', password: 'password', password_confirmation: 'password')
    @group = Group.create(name: 'Movies', icon: 'Movie-image', user: @user)
    @establishment = Establishment.create(name: 'Cinema', amount: 30, user: @user)
    @establishment.groups << @group
  end

  context 'Validations should be working' do
    it 'ALL validations should return true' do
      expect(@establishment).to be_valid
    end

    it 'Name validation should return false' do
      @establishment.name = nil
      expect(@establishment).not_to be_valid
    end

    it 'Name should return "Movies"' do
      expect(@establishment.name).to eql('Cinema')
    end

    it 'email should return a string' do
      expect(@establishment.amount).to be_a_kind_of(Numeric)
    end
  end
end
