require 'rails_helper'

describe UsersController, 'user' do
  let(:current_user) { users(:marty) }
  let(:google) { sites(:google) }

  it 'handles /register with GET' do
    get "/register"
    expect(response).to be_successful
  end

  it 'handles /mcfly with GET' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    get "/#{current_user.username}"
    expect(path).to render_template(:show)
  end

  it 'handles /users/:id/edit with GET' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    get "/users/#{current_user.username}/edit"
    expect(response).to render_template(:edit)
  end

  it 'handles /users/:id with valid params and PATCH' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    patch "/users/#{current_user.username}", params: { user: { id: current_user.id, first_name: 'Martin'} }
    expect(current_user.reload.first_name).to eq('Martin')
    expect(response).to redirect_to(current_user_path(current_user))
  end
end

describe UsersController, 'admin' do
  let(:current_user) { users(:doc) }
  let(:regular_user) { users(:marty) }

  it 'handles /admin/users with GET' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    get "/admin/users"
    expect(User.all.count).to eq(2)
    expect(path).to render_template(:index)
  end

  it 'handles /admin/users/:id with GET' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    get "/admin/users/#{regular_user.username}"
    expect(regular_user.username).to eq('mcfly')
    expect(path).to render_template(:show)
  end

  it 'handles /admin/users/:id/edit with GET' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    get "/admin/users/#{regular_user.username}/edit"
    expect(response).to render_template(:edit)
  end

  it 'handles /admin/users/:id with valid params and PATCH' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    patch "/admin/users/#{regular_user.username}", params: { user: { id: regular_user.id, first_name: 'Martin'}}
    expect(regular_user.reload.first_name).to eq('Martin')
    expect(response).to redirect_to(admin_user_path(regular_user))
  end
end
