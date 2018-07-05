class Admin::UsersController < ApplicationController
  before_action :is_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.by_last_name.paginate(page: params[:page], per_page: 20)
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to admin_users_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

end
