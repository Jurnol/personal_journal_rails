class Api::V1::DashboardController < ApplicationController
  before_action :authenticate_user

  def index
    user = @current_user
      if user
        render json: {user_journals: user.journals}
      else
  end
end