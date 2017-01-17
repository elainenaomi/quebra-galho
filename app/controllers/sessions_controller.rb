class SessionsController < ApplicationController
  def login
  end
  before_action :authenticate_user, :only => [:home, :profile, :setting]
  before_action :save_login_state, :only => [:login, :login_attempt]

  def login_attempt
    authorized_user = Usuario.authenticate(params[:login_or_email], params[:login_password])
    if authorized_user
      session[:usuario_id] = authorized_user.id
      session[:login] = authorized_user.login
      #session[:admin] = authorized_user.admin
      flash[:notice] = "Wow Welcome, you logged in as #{authorized_user.login}"
      redirect_to(:controller => 'home', :action => 'home')
    else
      flash[:error] = "Invalid Login or Password"
      flash[:color] = "invalid"
      redirect_to :action => 'login'
    end
  end

  def logout
    session[:usuario_id] = nil
    redirect_to :action => 'login'
  end
end
