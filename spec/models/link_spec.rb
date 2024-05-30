require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:link) { FactoryBot.create(:link, user_id: user.id) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(link).to be_valid
    end

    it 'is not valid without an original_url' do
      link.original_url = nil
      expect(link).to_not be_valid
      expect(link.errors[:original_url]).to include("can't be blank")
    end

    it 'is not valid without a lookup_code' do
      link.lookup_code = nil
      expect(link).to_not be_valid
      expect(link.errors[:lookup_code]).to include("can't be blank")
    end

    it 'is not valid without a name' do
      link.name = nil
      expect(link).to_not be_valid
      expect(link.errors[:name]).to include("can't be blank")
    end

    it 'is not valid with an invalid original_url format' do
      link.original_url = 'invalid_url'
      expect(link).to_not be_valid
      expect(link.errors[:original_url]).to include('Invalid URL format.')
    end
  end

  describe '#original_url_format' do
    it 'adds an error for invalid URL format' do
      link.original_url = 'invalid_url'
      link.valid?
      expect(link.errors[:original_url]).to include('Invalid URL format.')
    end

    it 'does not add an error for valid URL format' do
      link.original_url = 'https://validurl.com'
      link.valid?
      expect(link.errors[:original_url]).to be_empty
    end
  end

  describe '#shortened_url' do
    it 'returns the shortened URL' do
      link.lookup_code = 'abc123'
      expect(link.shortened_url).to eq("#{ENV.fetch('HOST', nil)}/s/abc123")
    end
  end
end
