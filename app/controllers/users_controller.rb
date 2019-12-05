class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.password = Array.new(8) { [*'A'..'Z', *'0'..'9'].sample }.join
    user.save!

    user.centrals << current_user.centrals.find(params[:central_id]) if params[:central_id].present?
    user.stores << current_user.stores.find(params[:store_id]) if params[:store_id].present?

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
