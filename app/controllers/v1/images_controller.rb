module V1
  class ImagesController < ApplicationController
    def create
      @post = Post.find_by(id: params[:post_id])
      @image = @post.images.build(image_params)

      if @image.save
        render json: @image
      else
        render json: @image.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @image = Image.find_by(id: params[:id])

      if @image
        @image.delete
        head :no_content
      else
        render json: {}, status: :not_found
      end
    end

    private

    def image_params
      params.require(:image).permit(:url)
    end
  end
end
