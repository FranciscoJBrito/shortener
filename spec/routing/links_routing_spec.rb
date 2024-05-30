require 'rails_helper'

RSpec.describe LinksController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/links').to route_to('links#index')
    end
  end
end
