class LikesController < ApplicationController
before_action :set_variables

  def like
    like = current_user.likes.new(slide_id: @slide.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(slide_id: @slide.id)
    like.destroy
  end

  private

  def set_variables
    @slide = Slide.find(params[:slide_id])
    @id_name = "id=\"like-link-#{@slide.id}\""
    @id_heart = "id=\"heart-#{@slide.id}\""
  end

end
