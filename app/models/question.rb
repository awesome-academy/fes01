class Question < ApplicationRecord
  belongs_to :lesson
  has_many :answers, dependent: :destroy

  scope :all_questons, ->(lesson_id){where lesson_id: lesson_id}
end
