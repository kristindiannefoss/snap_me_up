class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_by(
      email: env['omniauth.auth']['info']['email'],
      first_name: env['omniauth.auth']['info']['first_name'],
      last_name: env['omniauth.auth']['info']['last_name'],
      uid:  env['omniauth.auth']['uid'],
      urls: (env['omniauth.auth']['info']['urls']).to_json,
      token: env["omniauth.auth"]["credentials"]["token"]
    )
      flash[:success] = "Welcome!"
      session[:user_id] = @user.id
      redirect_to root_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
