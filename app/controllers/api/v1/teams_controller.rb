class Api::V1::TeamsController < ApplicationController
  respond_to :json

  def index
    respond_with Team.all(current_user)
  end

  def show
    @name = Team.find_name(current_user, params[:id])
    @members = Team.members(current_user, params[:id])
    respond_with [@name, @members]
  end

  def members
    respond_with Team.members(current_user, params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:name, :id)
  end
end
