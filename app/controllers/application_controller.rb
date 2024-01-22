class ApplicationController < ActionController::Base

  def decoded_token
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      JWT.decode(token, Rails.application.credentials.jwt_secret_key, true, {algorithm: 'HS256'})
    rescue JWT::DecodeError
      nil
    end
  end
end
