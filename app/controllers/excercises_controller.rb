class ExcercisesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :load_lessons, only: [:new, :create]
  before_action :load_excercise, :load_answer_correct, only: [:edit,
    :show, :update]

  def new
    @excercise = Excercise.new
    respond_to do |form|
      form.html
      form.js
    end
  end

  def create
    params[:excercise][:user_id] = current_user.id
    ActiveRecord::Base.transaction do
      @excercise = Excercise.create excercise_params
      create_data @excercise
    end
    respond_to do |form|
      form.html{redirect_to @excercise}
      form.js
    end
  end

  def index
    @excercises = current_user.excercises.sort_by_updated

    @excercises = if params[:search].present?
                    @excercises.search_name_lesson(params[:search])
                  else
                    @excercises
                  end.paginate page: params[:page],
                    per_page: Settings.excercises.pag_max
  end

  def show; end

  def edit; end

  def update
    results = params["excercise"]["detail_excercises_attributes"].values
    ActiveRecord::Base.transaction do
      if results
        results.each do |answer|
          id = answer.values[2]
          answer_id = answer.values[1]
          question = DetailExcercise.find_by id: id
          question.update_attributes answer_id: answer_id
        end
      else
        flash[:danger] = t ".data_fail"
      end
      result_handle results
    end
    redirect_to excercises_path
  end

  private

  def result_handle results
    @point = 0

    @answers_correct.each do |correct|
      results.each do |answer|
        question_id = answer.values[0].to_i
        answer_id = answer.values[1].to_i
        next unless (correct[0] == question_id) && (correct[1] == answer_id)
        @point += 1
      end
    end
    @excercise.update_attributes result: @point
  end

  def load_answer_correct
    @answers_correct = {}
    @excercise.questions.each do |question|
      next if question.answers.number.blank?
      @answers_correct[question.id] = question.answers.number.first.id
    end
  end

  def create_data excercise
    load_questions params[:excercise][:lesson_id]
    @questions.each do |question|
      DetailExcercise.create(excercise_id: excercise.id,
        question_id: question.id)
    end
  end

  def load_lessons
    @lessons = Lesson.sort_by_created
  end

  def load_excercise
    @excercise = Excercise.find_by id: params[:id]
    if @excercise
      @detail_excercises = @excercise.detail_excercises
    else
      flash[:danger] = t ".error_message"
      redirect_to root_url
    end
  end

  def excercise_params
    params.require(:excercise).permit :lesson_id, :user_id
  end
end
