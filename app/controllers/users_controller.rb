class UsersController < ApplicationController
  before_action :load_user, except: [:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t ".welcome"
      redirect_to @user
    else
      flash.now[:danger] = t ".error"
      render :new
    end
  end

  def show
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
  end

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
