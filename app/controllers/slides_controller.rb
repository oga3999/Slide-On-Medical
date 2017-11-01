class SlidesController < ApplicationController
  before_action :set_slides, only:[:edit,:update,:destroy]

  def index
    @slides = Slide.all
  end

  def new
    if params[:back]
      @slide = Slide.new(slides_params)
    else
      @slide = Slide.new
    end
  end

  def create
    @slide = Slide.new(slides_params)
    if @slide.save
      redirect_to slides_path, notice:"スライドを投稿しました！"
    else
      render 'new'
    end
  end


private
  def slides_params
    params.require(:slide).permit(:title, :slide,:slide_cache, :slide_url, :slide_auther_comment, :remove_image)
  end

  def set_slides
    @slide = Slide.find(params[:id])
  end

end
