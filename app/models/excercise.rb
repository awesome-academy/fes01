class Excercise < ApplicationRecord
  include PublicActivity::Model
  tracked owner: ->(controller, _model){controller && controller.current_user}
  acts_as_paranoid

  belongs_to :user
  belongs_to :lesson
  has_many :detail_excercises, dependent: :destroy
  has_many :questions, through: :detail_excercises
  accepts_nested_attributes_for :detail_excercises

  scope :sort_by_updated, ->{order updated_at: :DESC}
end
