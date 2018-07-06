class SitesController < ApplicationController
  before_action :authorize

  def index
    @sites = Site.order(created_at: :desc).paginate(page: params[:page], per_page: 50)
  end

  def create
    @site = current_user.sites.new(site_params)
    if @site.save
      if @site.status == 'failed'
        redirect_to current_user_path(current_user), alert: "#{@site.url} failed to capture. Check the format of the URL."
      else
        redirect_to current_user_path(current_user)
      end
    else
      redirect_to current_user_path(current_user), alert: "#{@site.errors.full_messages[0]}."
    end
  end

  private

  def site_params
    params.require(:site).permit(:url, :user_id)
  end

end
