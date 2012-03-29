class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :authenticate, :get_current_user

  def current_user  # Used by acts_as_audited and cancan
    begin
      if session[:login]
        session[:login][:username]
      else
        "<client> " + ActionController::HttpAuthentication::Basic::user_name_and_password(request).first
      end
    rescue
      return "Unknown User"
    end
  end

	protected
  def get_current_user
    @current_user = current_user
  end

  def authenticate
    if request.authorization.try(:match, /^Basic/i)
      authenticate_or_request_with_http_basic do |username, password|
        reset_session
        Client.authenticate username, password
      end
    else
      unless request.path_parameters[:controller] == "session" then
				#puts "Auth: %s :: %s" % [request.path_parameters[:controller],session[:login][:expires]]
				#puts session.inspect
        unless session[:login] && session[:login][:expires] > Time.now
          redirect_to login_url
          return false
        end
      end
    end
	end

end
