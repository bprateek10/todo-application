class TodoItemsController < ApplicationController
	before_action :set_user, only: [:index, :create]
	before_action :set_todo_item, only: [:destroy, :complete]

	def index
		@todo_items = @user.todo_items
	end

	def create
		@todo_item = @user.todo_items.build(todo_item_params)
		@todo_item.save
		@todo_items = @user.todo_items
	end

	def destroy
		@todo_item.destroy ? flash[:notice] = "Todo Item Deleted" : flash[:alert] = "Unable to delete todo item"
		redirect_to user_todo_items_path(current_user)
	end

	def sort
		params[:todo_item].each_with_index do |id, index|
			TodoItem.where(id: id).update_all(position: index + 1)
		end
		head :ok
	end

	def complete
		@todo_item.update_attribute('completed_at', Time.now)
		render :json => { :completed_at => @todo_item.completed_at.strftime('%d %b, %Y'), :success => true }
	end

	private
		def set_user
			@user = User.find_by_id(params[:user_id])
			return true if @user.present?
			flash[:alert] = "User not found"
			redirect_to root_path
		end

		def set_todo_item
			@todo_item = TodoItem.find_by_id(params[:id])
			return true if @todo_item.present?
			flash[:alert] = "Item not found"
			redirect_to user_todo_items_path(current_user)
		end

		def todo_item_params
      params.require(:todo_item).permit(:description, :due_date)
    end
end