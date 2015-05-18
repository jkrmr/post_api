require 'rails_helper'

describe V1::CommentsController, type: :controller do
  let(:saved_post) { create(:post_with_comment) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index, post_id: saved_post, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      post :create, post_id: saved_post, comment: comment_params, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      comment = saved_post.comments.first

      delete :destroy, post_id: saved_post, id: comment, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  def comment_params
    { content: 'Comment text.', user_id: saved_post.author.id }
  end
end
