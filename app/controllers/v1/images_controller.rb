module V1
  class ImagesController < ApplicationController
    before_action :ensure_post_exists, except: :destroy

    def create
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
