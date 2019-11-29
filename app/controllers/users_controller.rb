class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create(user_params)
    user.password = Array.new(8) { [*'A'..'Z', *'0'..'9'].sample }.join
    user.save!
   
    if params[:central_id].present?
      user.centrals << Central.find(params[:central_id])
    end

    if params[:store_id].present?
      user.stores << Store.find(params[:store_id])
    end
    
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
