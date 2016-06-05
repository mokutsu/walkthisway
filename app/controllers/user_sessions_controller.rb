class UserSessionsController < ApplicationController

  def new
    @user = User.new
    @gobbledegook = false
  end

  def create
    if @user = login(params[:email], params[:password])
      flash.now[:success] = "You are now logged in."
      redirect_back_or_to root_path
    else
      flash.now[:alert] = 'Username and/or password is incorrect.'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root')
  end
end
