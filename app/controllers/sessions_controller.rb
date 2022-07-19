class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
  end

  def create
    if user = User.find_by(email: params[:email])&.authenticate(params[:password])
      cookies.encrypted[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to login_url, notice: 'Invalid credentials'
    end
  end

  def google
    id = flash['google_sign_in']['id_token']
    google = GoogleSignIn::Identity.new id

    user = User.find_by email: google.email_address
    unless user
      user = User.new email: google.email_address, first_name: google.given_name, last_name: google.family_name
      user.save!
    end

    cookies.encrypted[:user_id] = user.id
    redirect_to root_url
  end

  def logout
    cookies.delete :user_id
    redirect_to login_url
  end

end
