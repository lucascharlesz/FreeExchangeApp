class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :set_devise_layout

  def notification_alert(type="", title="", text="")
    return {
      position: 'top-right',
      type: type,
      title: title,
      text: text,
      showConfirmButton: false,
      timer: 1500,
    }
  end

  def confirmation_alert(type="", title="", text="")
    return {
      title: title,
      confirmation: message,
      type: type,
    }
  end

  protected
  def set_devise_layout
    if devise_controller? && resource_name == :user
      "backoffice_login"
    else
      "application"
    end
  end
end
