class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  private
  def layout_by_resource
    if devise_controller?
      "devise"
    elsif params[:controller] == 'home'
      "landing_page"
    else
      "application"
    end
  end
end
