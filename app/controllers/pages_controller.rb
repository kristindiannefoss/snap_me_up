class PagesController < ApplicationController
  def index
    @teams        = Team.teams_list(current_user)
    @team_members = Team.roster_hashes(current_user, @teams)
  end
end
