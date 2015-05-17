module V1
  class PostsController < ApplicationController
    before_action :find_post, only: %i(show update destroy)

    def index
      @posts = Post.most_recent
      render json: @posts
    end

    def create
      author_id = post_params.delete(:user_id)
      @author   = User.find_by(id: author_id)
      @post     = Post.new(post_params) { |post| post.author = @author }

      if @post.save
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    def show
      if @post
        render json: @post
      else
        render json: {}, status: :not_found
      end
    end

    def update
      if @post.update_attributes(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    def destroy
      if @post
        @post.archive
        head 204
      else
        render json: {}, status: :not_found
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end

    def find_post
      @post = Post.find_by(id: params[:id])
    end
  end
end
