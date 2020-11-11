class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "sign in successful"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your accoutn has been succesfully updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
     @user.destroy
     session[:user_id] = nil
     flash[:notice] = "Profile and all associated Articles Deleted"
     redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user  = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user
        flash[:alert] = "You can only Edit or Delete your own Profile"
        redirect_to @user
      end
    end
end