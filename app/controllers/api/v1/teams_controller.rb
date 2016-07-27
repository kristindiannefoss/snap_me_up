class Api::V1::TeamsController < ApplicationController
  respond_to :json

  def index
    respond_with Team.all(current_user)
  end

  def show
    # id = Team.find_by_id(current_user, params[:id])
    @name = Team.find_name(current_user, params[:id])
    @members = Team.members(current_user, params[:id])
    respond_with @name, @members
  end

  def members
    respond_with Team.members(current_user, params[:id])
  end

  # def create
  #   team = Team.new(team_params)
  #   if team.save
  #     respond_with(team, status: 201, location: api_v1_team_path(team))
  #   else
  #     render json: { errors: team.errors }, status: 422, location: api_v1_teams_path
  #   end
  # end
  #
  # def update
  #   team = Team.find(params[:id])
  #   if team.update(team_params)
  #     respond_with(team, status: 200, location: api_v1_team_path(team))
  #   else
  #     render json: team.errors, status: 422
  #   end
  # end
  #
  # def destroy
  #   Team.find(params[:id]).destroy
  #   head :no_content
  # end

  private

  def team_params
    params.require(:team).permit(:name, :id)
  end
end
