# frozen_string_literal: true

module AuthenticationHelper
  def check_auth(token: nil)
    request.headers[:Authorization] = "Bearer #{token}"
  end
end