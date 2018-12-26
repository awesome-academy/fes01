class DetailExcercise < ApplicationRecord
  belongs_to :excercise
  belongs_to :question

  scope :questions_of_excercise, ->(id){where excercise_id: id}
end
