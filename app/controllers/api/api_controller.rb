class Api::ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  respond_to :json
  include ActionController::MimeResponds
  include ActionController::ImplicitRender

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
