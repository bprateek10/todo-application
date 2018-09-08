class Users::SessionsController < Devise::SessionsController
	skip_before_action :require_login, only: [:new, :create]
	
	protected  
		def after_sign_in_path_for(resource)
			user_todo_items_path(resource)
    end
end