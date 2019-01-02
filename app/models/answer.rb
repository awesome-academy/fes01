class Answer < ApplicationRecord
  belongs_to :question

  scope :find_by_question, ->(question_id){where question_id: question_id}
  scope :number, ->{where is_correct: true}
end
