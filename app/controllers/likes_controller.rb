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

  def create
    @like = Like.create(user_id: current_user.id, slide_id: params[:slide_id])
    @likes = Like.where(slide_id: params[:slide_id])
    @slides = Slide.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, slide_id: params[:slide_id])
    like.destroy
    @likes = Like.where(slide_id: params[:slide_id])
    @slides = Slide.all
  end

  private

  def set_variables
    @slide = Slide.find(params[:slide_id])
    @id_name = "#like-link-#{@slide.id}"
    @id_heart = "#heart-#{@slide.id}"
  end

end
