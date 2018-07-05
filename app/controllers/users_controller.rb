class UsersController < ApplicationController
  before_action :is_logged_in, only: [:new, :create]
  before_action :authorize, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @sites = current_user.sites.succeeded.order(created_at: :desc)
    @site = Site.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

end
