class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  # return auth token once user is authenticated
  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    @user = User.find_by(email: auth_params[:email])
    @store = @user.stores.first
    @central = @user.centrals.first
    json_response(auth_token: auth_token, home: { central: @central, store: @store })
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
