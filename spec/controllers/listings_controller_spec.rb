require 'rails_helper'

RSpec.describe ListingsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_success
    end
  end
end
