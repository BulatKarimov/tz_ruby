class Api::V1::ApplicationController < Api::ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_auth

  def check_auth
    unless request.headers['Authorization'] == "Bearer #{ENV['AUTH_TOKEN']}"
      return head 401
    end
  end
end
