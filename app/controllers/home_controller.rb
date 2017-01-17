class HomeController < ApplicationController
  before_action :verify_user_login
  def home
  end
end
