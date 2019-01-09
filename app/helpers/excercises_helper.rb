module ExcercisesHelper
  def load_answer_correct
    @answers_correct = {}
    @excercise.questions.each do |question|
      next if question.answers.number.blank?
      @answers_correct[question.id] = question.answers.number.first.id
    end
  end
end
