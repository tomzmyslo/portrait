class ApplicationController < ActionController::Base

  protect_from_forgery unless: -> { request.format.json? }

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    unless current_user
      redirect_to login_path, alert: 'You must be logged in to access that page.'
    end
  end

  def is_logged_in
    if current_user
      redirect_to root_url, alert: 'You are already logged in.'
    end
  end

  def is_admin
    unless current_user.admin == true
      redirect_to root_url, alert: 'You are unauthorized to access that page.'
    end
  end

  # protected
  #
  # def user_required
  #   authenticate_or_request_with_http_basic do |username, password|
  #     @current_user = User.authenticate username, password
  #     @current_user.present?
  #   end
  # end

end
