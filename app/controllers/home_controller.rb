class HomeController < ApplicationController
  # skip_before_action :authorize_request, only: :index
  def index
    @centrals = @current_user.centrals
    @stores = @current_user.stores
    json_response(centrals: @centrals, stores: @stores)
  end
end
