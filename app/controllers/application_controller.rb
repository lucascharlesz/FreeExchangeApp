class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :set_devise_layout

  protected
  def set_devise_layout
    if devise_controller? && resource_name == :user
      "backoffice_login"
    else
      "application"
    end
  end
end
