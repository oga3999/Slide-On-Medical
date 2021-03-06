class SlidesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_slides, only:[:edit,:update,:destroy,:show]

  def top
    @slides = Slide.all.order('created_at desc').limit(6)
    @rank = Slide.find(Like.group(:slide_id).order('count(slide_id) desc').limit(6).pluck(:slide_id))

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slides }
    end
  end

  def index
    @slides = Slide.all
    @tags = Slide.tag_counts_on(:tags)
    @rank = Slide.find(Like.group(:slide_id).order('count(slide_id) desc').limit(6).pluck(:slide_id))

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slides }
    end
  end

  def user_slide
    @user = current_user
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
      NoticeMailer.sendmail_slide(@slide).deliver
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

  def destroy
    @slide.destroy
    redirect_to user_slide_path, notice:"スライドを削除しました！"
  end


private
  def slides_params
    params.require(:slide).permit(:title, :slide, :slide_cache, :slide_url, :author_comment, :remove_slide, :tag_list)
  end

  def set_slides
    @slide = Slide.find(params[:id])
  end

end
