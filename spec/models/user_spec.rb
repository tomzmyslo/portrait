require 'rails_helper'

describe User, 'authentication' do
  it 'should authenticate a valid admin user' do
    user = User.new email: 'doc.brown@example.com', password: 'password', admin: true
    logged_in_user = user.authenticate('password')
    expect(logged_in_user.admin).to be true
  end

  it 'should not authenticate valid admin user with wrong password' do
    user = User.new email: 'doc.brown@example.com', password: 'password'
    logged_in_user = user.authenticate('wrong')
    expect(logged_in_user).to be false
  end

  it 'should not authenticate valid admin email with nil password' do
    user = User.new email: 'doc.brown@example.com', password: 'password'
    logged_in_user = user.authenticate('')
    expect(logged_in_user).to be false
  end

  it 'should authenticate a valid user' do
    user = User.new email: 'marty.mcfly@example.com', password: 'password'
    logged_in_user = user.authenticate('password')
    expect(logged_in_user.admin).to be false
  end
end

describe User, 'validations' do
  it 'should have a first name' do
    user = User.new
    user.valid?
    expect(user.errors[:first_name]).not_to be_empty
  end

  it 'should have a last name' do
    user = User.new
    user.valid?
    expect(user.errors[:last_name]).not_to be_empty
  end

  it 'should have a username' do
    user = User.new
    user.valid?
    expect(user.errors[:username]).not_to be_empty
  end

  it 'should have a email' do
    user = User.new
    user.valid?
    expect(user.errors[:email]).not_to be_empty
  end

  it 'should have a password' do
    user = User.new
    user.valid?
    expect(user.errors[:password]).not_to be_empty
  end

  it 'should have a unique username' do
    user = User.new username: users(:doc).username
    user.valid?
    expect(user.errors[:username]).not_to be_empty
  end

  it 'should have a properly formatted email address' do
    user = User.new email: 'doc@example'
    user.valid?
    expect(user.errors[:email]).not_to be_empty
  end

  it 'should not have an email address for username' do
    user = User.new username: 'doc@example.com'
    user.valid?
    expect(user.errors[:username]).not_to be_empty
  end
end
