class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def show
    @micropost = Micropost.find_by id: params[:id]
    @comments = @micropost.comments
  end

  def create
    @micropost = current_user.microposts.build micropost_params

    if @micropost.save
      flash[:success] = t ".micropost_created"
      redirect_to root_url
    else
      @feed_items = []
      flash[:danger] = t ".fail_to_create"
      redirect_to root_url
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] = t ".micropost_deleted"
      redirect_to request.referrer || root_url
    else
      flash.now[:danger] = t ".del_micropost_fail"
      redirect_to root_url
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit :content, :picture, :title
  end

  def correct_user
    @micropost = current_user.microposts.find_by id: params[:id]
    redirect_to root_url if @micropost.nil?
  end
end
