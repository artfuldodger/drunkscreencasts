class UsersController < ApplicationController
  def index
    @users = User.alphabetized
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Sweet! You are signed up!'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:login, :email, :name, :password, :password_confirmation)
  end
end
