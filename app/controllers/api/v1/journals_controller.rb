class Api::V1::JournalsController < ApplicationController
  before_action :authenticate_user

  def index
    user = @current_user
      if user
        render json: {user_info: user, user_journals: user.journals}, status: 200
      end
  end
end