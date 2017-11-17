class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @slide = @comment.slide
    respond_to do |format|
      if @comment.save
        format.html { redirect_to slide_path(@slide), notice: "コメントを投稿しました" }
        format.json { render :index }
      else
        format html { render :new }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @slide = @comment.topic
  end

  def destroy
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.destroy
        format.js{render :index}
      else
        format.html{render :index}
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:slide_id, :content)
  end
end
