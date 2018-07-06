require 'rails_helper'

describe SitesController, 'admin' do
  let(:current_user) { users(:doc) }
  let(:google) { sites(:google) }
  # let(:apple_site) { sites(:apple) }

  it 'handles /admin/sites with GET' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    get "/admin/sites"
    expect(Site.all.count).to eq(2)
    expect(response).to render_template(:index)
  end

  it 'handles /admin/sites/:id with DELETE' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    delete admin_site_path(google)
    expect(Site.all.count).to eq(1)
    expect(response).to redirect_to(admin_sites_path)
  end
end

# describe SitesController, 'js api' do
  # before { login_as :admin }

  # it 'handles / with valid parameters and POST' do
  #   expect {
  #     pst :sites, site: { url: 'https://google.com' }, format: :json
  #     expect(assigns(:site).user).to eq(@user)
  #     expect(response).to be_successful
  #     expect(response.body).to be_include('"status":"succeeded"')
  #   }.to change(Site, :count).by(1)
  # end

  # it 'handles / with empty url and POST' do
  #   expect {
  #     pst :sites, format: :json
  #     expect(response).to be_successful
  #     expect(response.body).to be_include(':{"errors":{"url":["is invalid"]}}')
  #   }.not_to change(Site, :count)
  # end

  # it 'handles /sites with invalid url and POST' do
  #   expect {
  #     pst :sites, site: { url: 'invalid' }, format: :json
  #     expect(response).to be_successful
  #     expect(response.body).to be_include(':{"errors":{"url":["is invalid"]}}')
  #   }.not_to change(Site, :count)
  # end

# end
