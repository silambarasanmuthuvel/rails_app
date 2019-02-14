class ApplicationController < ActionController::Base
  before_action :authenticate_user!,expect: [:authenticate]
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      basic_auth=User.find_by_email(username)
      if basic_auth && basic_auth.valid_password?(password)
        sign_in :user, basic_auth
        render json: {email: current_user.email, id: current_user.id}
      else
        render json: {error: "Unauthorized access" }
      end
    end
  end

end

