class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: params[:userData][:email])
    if user &.authenticate(params[:userData][:password])
      token = encode_token({user_id: user.id})
      render json: { token: token }, status: :ok
    else 
      render json: { error: "Invalid Credentials"}, status: :unauthorized
    end
  end


  private

  def encode_token(payload)
    # might user a tocken expiration here at some point, but not necessary
    #for the time being
    # exp = 2.hours.from_now.to_i
    # payload[:exp] = exp
    JWT.encode(payload, Rails.application.credentials.jwt_secret_key)
  end
end
