class SitesController < ApplicationController
  before_action :authorize

  def index
    @sites = Site.order(created_at: :desc).paginate(page: params[:page], per_page: 50)
  end

  def create
    @site = current_user.sites.new(site_params)
    if @site.save
      if @site.status == 3
        redirect_to current_user_path(current_user), "Portrait failed to capture #{@site.url}."
      else
        redirect_to current_user_path(current_user)
      end
    else
      redirect_to current_user_path(current_user), alert: "#{@site.errors.full_messages[0]}."
    end
  end

  private

  def set_site
    # @site = current_user.sites.build params.fetch(:site, {}).permit(:url)
  end

  def site_params
    params.require(:site).permit(:url, :user_id)
  end

end
