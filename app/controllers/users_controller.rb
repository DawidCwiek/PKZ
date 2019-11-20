class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create(user_params)
    user.password = Array.new(8){[*"A".."Z", *"0".."9"].sample}.join
    user.save!
    UserMailer.user_password(user).deliver
    json_response({ message: Message.account_created }, :created)
  end

  private

  def user_params
    params.permit(
      :email,
      :name,
      :surname,
      :phone_number
    )
  end
end
