class Api::V1::JournalsController < ApplicationController
  before_action :authenticate_user

  def index
    user = @current_user
      if user
        render json: {user_info: { first_name: user.first_name, last_name: user.last_name, email: user.email }, user_journals: user.journals}, status: 200
      end
  end
end