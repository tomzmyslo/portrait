class SessionsController < ApplicationController
  before_action :is_logged_in, only: [:new, :create]
  before_action :authorize, only: [:destroy]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to login_path, alert: "Email or password is invalid."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
