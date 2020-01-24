class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.password = Array.new(8) { [*'A'..'Z', *'a'..'z', *'0'..'9'].sample }.join
    user.save!

    user.centrals << current_user.centrals.find(params[:central_id]) if params[:central_id].present?
    user.workers.create(workers_params) if params[:store_id].present?

    UserMailer.user_password(user).deliver
    json_response({ message: Message.account_created }, :created)
  end

  def destroy
    if params[:store_id]
      Store.find(params[store_id]).users.find(params[:user_id]).destroy
    elsif params[central_id]
      Central.find(params[central_id]).users.find(params[:user_id]).destroy
    end
    json_response(nil, :no_content)
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

  def workers_params
    params.permit(
     :store_id,
     :manager
    )
  end
end
