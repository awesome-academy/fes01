class Lesson < ApplicationRecord
  has_many :excercises, dependent: :destroy
  has_many :questions, dependent: :destroy
end
