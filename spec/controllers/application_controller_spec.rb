require 'rails_helper'

describe ApplicationController, type: :controller do
  controller do
    def index
      render json: {}
    end
  end

  describe '#ensure_json_request' do
    it 'is called before any action' do
      allow(controller).to receive(:ensure_json_request)

      get :index

      expect(controller).to have_received(:ensure_json_request)
    end

    it 'returns HTTP 406 for non-JSON requests' do
      get :index

      expect(response).to have_http_status(:not_acceptable)
    end

    it 'return HTTP 200 for a valid JSON request' do
      get :index, format: :json

      expect(response).to have_http_status(:success)
    end
  end
end
