class DashboardController < ApplicationController
  before_action authentitcate_user

  def index
    user = @current_user
  end
end