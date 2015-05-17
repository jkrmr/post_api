require 'rails_helper'

describe V1::PostsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      user = FactoryGirl.create(:user)

      post :create, post: post_params(user_id: user.id), format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      post = FactoryGirl.create(:post)

      get :show, id: post.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    it 'returns http success' do
      post = FactoryGirl.create(:post)

      put :update, id: post, post: post_params(title: 'Edited'), format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success' do
      post = FactoryGirl.create(:post)

      delete :destroy, id: post, post: post_params(post: post), format: :json

      expect(response).to have_http_status(:success)
    end
  end

  def post_params(overrides={})
    attrs = if post = overrides[:post]
              post.slice(:title, :content, :user_id)
            else
              { title: 'New Post', content: 'Post contents.' }
            end
    attrs.merge(overrides)
  end
end
