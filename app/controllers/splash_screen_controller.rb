class SplashScreenController < ApplicationController
  def index
    redirect_to groups_path if user_signed_in?
  end
end
