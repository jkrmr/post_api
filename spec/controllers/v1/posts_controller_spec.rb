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
      user = create(:user)

      post :create, post: post_params(user_id: user.id), format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      post = create(:post)

      get :show, id: post.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    it 'returns http success' do
      post = create(:post)

      put :update, id: post, post: post_params(title: 'Edited'), format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success' do
      post = create(:post)

      delete :destroy, id: post, post: post_params(post: post), format: :json

      expect(response).to have_http_status(:success)
    end
  end

  def post_params(overrides={})
    attrs = params_for(overrides[:post])
    attrs.merge(overrides)
  end

  def params_for(post)
    if post.nil?
      { title: 'New Post', content: 'Post contents.' }
    else
      post.slice(:title, :content, :user_id)
    end
  end
end
