require 'rails_helper'

describe V1::ReportsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new

      expect(response).to have_http_status(:success)
    end
  end
end
