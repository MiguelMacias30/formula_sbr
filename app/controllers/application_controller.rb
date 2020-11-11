class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
		views_path
  end
end
