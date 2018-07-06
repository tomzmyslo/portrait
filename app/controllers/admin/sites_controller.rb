class Admin::SitesController < ApplicationController
  before_action :is_admin

  def index
    @sites = Site.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to admin_sites_path, notice: 'Site was successfully removed.'
  end

end
