class PagesController < ApplicationController
  def index
    @teams        = Team.teams_list(current_user)
    # @team_members = Member.team_members(@team)

  end
end
