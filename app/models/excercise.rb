class Excercise < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_many :detail_excercises, dependent: :destroy
  has_many :questions, through: :detail_excercises
  accepts_nested_attributes_for :detail_excercises

  scope :sort_by_created, ->{order created_at: :DESC}
end
