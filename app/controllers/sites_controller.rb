class SitesController < ApplicationController
  # before_action :user_required

  def index
    @sites = Site.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
    @site  = Site.new
  end

  def create
    @site = current_user.sites.build params.fetch(:site, {}).permit(:url)
    @site.save
    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json
    end
  end

end
