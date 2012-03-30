##
#
class SessionController < ApplicationController

  def new
    session[:login] = nil
    if params[:username]
      if user = User.authenticate(params[:username], params[:password])
        reset_session
        session[:login] = { 
					:email => user.email,
					:user_id => user.id,
					:expires => Time.now + 3600,
					:username => params[:username]
				}
        flash[:notice] = "Logged in successfully"
        return redirect_to root_path
      else
        flash[:notice] = "Login failed"
      end
    end
		puts "Rendering new"
    render "new", :layout => "no_session"
  end

  def destroy
		puts "Killing session: %s" % session.inspect
		reset_session
		puts "Killing session: %s" % session.inspect
    flash[:notice] = "Logout successful!"
    return redirect_to root_path
  end

end

