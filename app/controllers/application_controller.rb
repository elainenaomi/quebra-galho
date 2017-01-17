class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_user

  protected

  def authenticate_user
    if session[:usuario_id]
      @current_user = User.find session[:usuario_id]
      return true
    else
      redirect_to(:controller => 'sessions', :action => 'login')
      return true
    end
  end

  def save_login_state
    if session[:usuario_id]
      redirect_to(:controller => 'home', :action => 'home')
      return false
    else
      return true
    end
  end


  def logged_user
    Usuario.find_by_id(session[:usuario_id])
  end

  def verify_user_login
    redirect_to '/login' if session[:usuario_id] == nil
  end

  def preload(subject,*items)
    items.each do |item|
      ActiveRecord::Associations::Preloader.new.preload(subject, item)
    end
  end
end
