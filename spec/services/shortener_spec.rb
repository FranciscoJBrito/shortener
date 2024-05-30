require 'rails_helper'
require_relative '../../app/services/shortener'

RSpec.describe ShortenerService, type: :service do
  let(:url) { 'https://example.com' }
  let(:link_name) { 'Example Link' }
  let(:user_id) { 1 }
  let(:link_model) { class_double('Link').as_stubbed_const }

  describe '#generate_short_link' do
    it 'creates a short link with the given attributes' do
      allow(link_model).to receive(:exists?).and_return(false)
      expect(link_model).to receive(:create).with(
        original_url: url,
        lookup_code: kind_of(String),
        name: link_name,
        user_id: user_id
      )

      service = ShortenerService.new(url, link_name, user_id, link_model)
      service.generate_short_link
    end
  end

  describe '#lookup_code' do
    it 'generates a unique lookup code' do
      service = ShortenerService.new(url, link_name, user_id, link_model)
      allow(link_model).to receive(:exists?).and_return(false)

      code = service.lookup_code
      expect(code.length).to eq(7)
    end

    it 'retries if the lookup code already exists' do
      service = ShortenerService.new(url, link_name, user_id, link_model)
      allow(link_model).to receive(:exists?).and_return(true, false)

      code = service.lookup_code
      expect(code.length).to eq(7)
    end
  end

  describe '#fresh_code' do
    it 'generates a 7-character code' do
      service = ShortenerService.new(url, link_name, user_id, link_model)
      code = service.send(:fresh_code)
      expect(code.length).to eq(7)
    end
  end
end
