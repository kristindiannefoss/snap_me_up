require 'oauth2'

class SessionsController < ApplicationController
  CLIENT = OAuth2::Client.new('x', 'y', :site => 'https://auth.teamsnap.com')

  def new
    redirect_to CLIENT.auth_code.authorize_url(:scope => 'read write', :redirect_uri => teamsnap_callback_url )
  end

  def create
    # binding.pry
    token = CLIENT.auth_code.get_token(params['code'], :redirect_uri => teamsnap_callback_url)
    # binding.pry


    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome back!"
      redirect_to root_path
    else
      flash[:warning] = "You have entered incorrect email and/or password."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
