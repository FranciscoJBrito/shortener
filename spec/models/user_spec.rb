# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:user_two) { FactoryBot.create(:user, email: 'unique_email@example.com') }
  let(:link_one) { FactoryBot.create(:link, user: user) }
  let(:link_two) { FactoryBot.create(:link, user: user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'is not valid with a duplicate email' do
      user_two.email = user.email
      expect(user_two).to_not be_valid
      expect(user_two.errors[:email]).to include('has already been taken')
    end
  end

  describe 'associations' do
    it 'has many links' do
      expect(user.links).to include(link_one, link_two)
    end

    it 'destroys associated links when destroyed' do
      expect { user.destroy }.to change { Link.count }.by(0)
    end
  end
end
