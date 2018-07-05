class Admin::SitesController < ApplicationController
  before_action :is_admin

  def index
    @sites = Site.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

end
