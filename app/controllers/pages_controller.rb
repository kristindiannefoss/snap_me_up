class PagesController < ApplicationController
  def index
    # binding.pry
    @teams = Team.all(current_user) #[["Team Teamtastic", 1931903], ["CU Buffs", 1974307]]

    # @members = Team.team_members(current_user, team)
  end

  # def show
  #   @team = Team.find(params[:id])
  # end
end
