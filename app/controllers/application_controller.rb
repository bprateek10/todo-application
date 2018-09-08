class ApplicationController < ActionController::Base
	before_action :require_login

	private
		def require_login
			unless current_user.present?
				flash[:error] = "Log in first"
				redirect_to root_path
			end
		end
end
