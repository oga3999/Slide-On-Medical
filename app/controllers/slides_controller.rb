class SlidesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_slides, only:[:edit,:update,:destroy,:show]

  def index
    @slides = Slide.all
    @tags = Slide.tag_counts_on(:tags)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slides }
    end
  end

  def tag
    @slides = Slide.tagged_with(params[:name])
    @tags = Slide.tag_counts_on(:tags)

    render 'index'
  end

  def show
    @comment = @slide.comments.build
    @comments = @slide.comments
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
    @slide.user_id = current_user.id
    if @slide.save
      redirect_to slides_path, notice:"スライドを投稿しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @slide.update(slides_params)
      redirect_to slides_path, notice:"投稿内容を編集しました！"
    else
      render 'edit'
    end
  end


private
  def slides_params
    params.require(:slide).permit(:title, :slide,:slide_cache, :slide_url, :slide_auther_comment, :remove_image, :tag_list)
  end

  def set_slides
    @slide = Slide.find(params[:id])
  end

end
