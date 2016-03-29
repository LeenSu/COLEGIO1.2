class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_for_selection
  protected
  def layout_for_selection
    if controller_name == 'sessions' || controller_name == 'registrations' || controller_name == 'passwords'
      'login'
    else
      'admin'
    end
  end

end
