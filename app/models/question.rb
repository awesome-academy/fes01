class Question < ApplicationRecord
  belongs_to :lesson
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  scope :all_questons, ->(lesson_id){where lesson_id: lesson_id}
  scope :sort_by_created, ->{order created_at: :DESC}
end
