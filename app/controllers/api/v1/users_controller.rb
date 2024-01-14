class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save
    if user.save
      render json: { message: "Account successfully created"}, status: 201
    else
      render json: { error: user.errors.full_messages.to_sentence }, status: 400
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end