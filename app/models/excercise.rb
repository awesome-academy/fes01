class Excercise < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_many :detail_excercises, dependent: :destroy
end
