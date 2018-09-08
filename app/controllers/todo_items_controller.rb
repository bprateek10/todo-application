class TodoItemsController < ApplicationController
	before_action :set_user
	before_action :set_todo_item
	def index

	end

	private
		def set_user
			@user = User.find_by_id(params[:user_id])
			return true if @user.present?
			flash[:alert] = "User not found"
			redirect_to root_path
		end

		def set_todo_item
			@user = User.find_by_id(params[:user_id])
			return true if @user.present?
			flash[:alert] = "User not found"
			redirect_to user_todo_items_path
		end
end