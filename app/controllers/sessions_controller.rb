class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_login(params[:user][:login])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Welcome back, #{current_user.name}!"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Come back soon!'
  end
end
