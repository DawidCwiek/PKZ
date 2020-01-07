module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      if current_user ||= user
        current_user
      else
        reject_unauthorized_connection
      end
    end

    private

    def user
      @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    rescue ActiveRecord::RecordNotFound
      false
    rescue ExceptionHandler::InvalidToken
      false
    end

    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(request.params['token'])
    end
  end
end
