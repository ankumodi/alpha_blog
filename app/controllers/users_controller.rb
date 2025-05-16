class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :show]
  def new
    @user = User.new
  end

  def show
    @articles = @user.articles
  end
  
  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Alpha blog, you have succesfully signed up."
      redirect_to articles_path
    else
      render :new
    end
  end
  
  def update
    if @user.update(user_params)
      flash[:notice] = "Your account info was successfully updated."
      redirect_to articles_path
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end