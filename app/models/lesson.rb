class Lesson < ApplicationRecord
  has_many :excercises, dependent: :destroy
  has_many :questions, dependent: :destroy

  scope :sort_by_created, ->{order created_at: :DESC}
end
