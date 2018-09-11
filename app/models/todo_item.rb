class TodoItem < ApplicationRecord

  #Validations
  validates :description, presence: true
  
  #Associations
  belongs_to :user

  def completed?
    !completed_at.blank?
  end
end
