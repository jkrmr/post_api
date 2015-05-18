module V1
  class CommentsController < ApplicationController
    before_action :ensure_post_exists, except: :destroy

    def index
      @comments = @post.comments_thread
      render json: @comments
    end

    def create
      @comment = @post.comments.build(comments_params)
      @comment.make_child_of(id: params[:parent_id]) if params[:parent_id]

      if @comment.save
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @comment = Comment.find_by(id: params[:id])

      if @comment
        @comment.delete
        head :no_content
      else
        render json: {}, status: :not_found
      end
    end

    private

    def comments_params
      params.require(:comment).permit(:content, :user_id, :parent_id)
    end
  end
end
