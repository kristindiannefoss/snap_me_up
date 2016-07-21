require 'json'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :signed_in?
  helper_method :current_user

  def signed_in?
    !!current_user
  end

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_team
      @current_team ||= session[:current_team]
    end

    def auth_token
      @auth_token ||= session[:auth_token]
    end

    def user_logged_in?
      true unless auth_token.nil?
    end

    def set_current_user(user)
      session[:current_user] = user
    end

    def set_current_team(team)
      session[:current_team] = team
    end

end
