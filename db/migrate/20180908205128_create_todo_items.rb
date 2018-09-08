class CreateTodoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_items do |t|
      t.text :description
      t.date :completed_at
      t.date :due_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
