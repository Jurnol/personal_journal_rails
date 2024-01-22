class ApplicationController < ActionController::Base


private 

  def decoded_token
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      JWT.decode(token, Rails.application.credentials.jwt_secret_key, true, {algorithm: 'HS256'})
    rescue JWT::DecodeError
      nil
    end
  end

  def authenticate_user
    decoded = decoded_token

    if decoded_token
      @current_user = User.find_by(id: decoded[0]['user_id'])
    else 
      render json: {error: 'Unauthorized'}, status: :unauthorized
    end
  end
end
