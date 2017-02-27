class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(update_user_params)
      flash[:success] = "Your account was updated successfully."
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_articles = @uaer.articles.paginate(page: params[:page], per_page: 1)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def update_user_params
    params.require(:user).permit(:username, :email)
  end
end
