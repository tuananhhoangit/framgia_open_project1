class CommentsController < ApplicationController

  def create
    @micropost = Micropost.find_by id: params[:micropost_id]
    @comment = @micropost.comments.build(content: params[:comment][:content],
      user: current_user)

    if @comment.save
      redirect_to @micropost
    end
  end

  def destroy
    @micropost = Micropost.find_by id: params[:micropost_id]
    @comment = @micropost.comments.find_by id: params[:id]
    @comment.destroy
    redirect_to @micropost
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end
end
