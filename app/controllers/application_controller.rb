
class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    '/admin/dashboard' 
  end

  def mobile_device?
	if session[:mobile_param]
		session[:mobile_param] == "1"
	else
		request.user_agent =~ /Mobile|webOS/
	end
  end

end
