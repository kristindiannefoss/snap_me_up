class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome!"
        redirect_to root_path
      else
        render :new
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :uid, :urls)
    end
end
