class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # with the devise gem - redirect to people index page on login
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || people_path
  end

  # with devise gem - redirect to the public root page on logout
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end
