class Question < ApplicationRecord
  acts_as_paranoid
  belongs_to :lesson
  has_many :answers, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc{|attributes| attributes["content"].blank?}

  scope :all_questons_by_lesson, ->(lesson_id){where lesson_id: lesson_id}
  scope :sort_by_created, ->{order created_at: :DESC}

  def self.to_csv options = {}
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |question|
        csv << question.attributes.values
      end
    end
  end

  def self.to_xls options = {}
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |question|
        csv << question.attributes.values
      end
    end
  end

  class << self
    def import file
      CSV.foreach(file.path, headers: true,
        col_sep: "|", header_converters: :symbol) do |row|
        row = row.to_hash
        answers_attributes = []
        row[:answers].split(";").each do |answer|
          answer_hash = Hash.new
          arr_answer = answer.split(",")
          answer_hash[:content] = arr_answer[0]
          answer_hash[:is_correct] = arr_answer[1]
          answers_attributes.push answer_hash
        end
        row[:answers_attributes] = answers_attributes
        row.delete :answers
        Question.create row
      end
    end
  end
end
