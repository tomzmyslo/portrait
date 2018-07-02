class UsersController < ApplicationController
  # before_action :user_required
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.by_last_name.paginate(page: params[:page], per_page: 20)
  end

  def show
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
    @user = User.find_by! name: params[:id]
    @user.destroy
    redirect_to users_url
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

end
