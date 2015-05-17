require 'rails_helper'

describe V1::ImagesController, type: :controller do
  describe 'GET #create' do
    it 'returns http success' do
      parent = FactoryGirl.create(:post)

      post :create, post_id: parent, image: image_params, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      image = FactoryGirl.create(:image)

      delete :destroy, post_id: image.post, id: image, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  def image_params
    { url: 'http://example.com/image.jpg' }
  end
end
