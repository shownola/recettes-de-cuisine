class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_chef, :logged_in?
  
  def current_chef
    @current_chef = Chef.find(session[:chef_id]) if session[:chef_id]
  end
end
