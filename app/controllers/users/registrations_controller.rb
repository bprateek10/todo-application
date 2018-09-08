class Users::RegistrationsController < Devise::RegistrationsController
	skip_before_action :require_login, only: [:new, :create]
end