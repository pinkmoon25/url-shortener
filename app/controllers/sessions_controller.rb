class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Signed In successfully'
      redirect_to new_link_path
    else
      flash[:alert] = 'Invalid username or password'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "logged out successfully!"
    redirect_to root_path
  end
end
