class Admin::QuestionsController < AdminController
  before_action :load_lessons, only: [:new, :create, :edit]
  before_action :load_question, only: [:edit, :update, :destroy]

  def new
    @question = Question.new
    @answers = @question.answers.build
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t ".create_success"
      redirect_to admin_questions_path
    else
      flash[:danger] = t ".create_fail"
      render :new
    end
  end

  def index
    @search_questions = Question.sort_by_created.search_content(params[:search])
    @questions = @search_questions.paginate page: params[:page],
      per_page: Settings.questions.pag_max
  end

  def edit; end

  def update
    if @question.update_attributes question_params
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t ".update_fail"
    end
    redirect_to admin_questions_path
  end

  def destroy
    if @question.destroy
      flash[:success] = t ".destroy_success"
      @questions = Question.all
    else
      flash[:danger] = t ".destroy_fail"
    end
    redirect_to admin_questions_path
  end

  private

  def question_params
    params.require(:question).permit :lesson_id, :content,
      answers_attributes: [:id, :content, :is_correct]
  end

  def load_question
    @question = Question.find_by id: params[:id]
    return if @question
    flash[:danger] = t ".not_found"
    redirect_to admin_questions_path
  end

  def load_lessons
    @lessons = Lesson.sort_by_created
  end
end
