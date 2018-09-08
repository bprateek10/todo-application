class Users::PasswordsController < Devise::PasswordsController
  skip_before_action :require_login
end