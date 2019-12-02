class CentralsController < ApplicationController
  def user_central
    @central = current_user.centrals.first
    json_response(@central, :ok)
  end
end
