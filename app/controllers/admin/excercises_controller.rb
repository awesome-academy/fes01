class Admin::ExcercisesController < AdminController
  before_action :load_excercise, only: [:show, :destroy]
  before_action :load_answer_correct, only: :show

  def index
    @excercises = Excercise.sort_by_updated

    @excercises = if params[:search].present?
                    @excercises.search_name_lesson(params[:search])
                  else
                    @excercises
                  end.paginate page: params[:page],
                    per_page: Settings.excercises.pag_max
  end

  def show; end

  def destroy
    if @excercise.destroy
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_fail"
    end
    redirect_to admin_excercises_path
  end

  private

  def excercise_params
    params.require(:excercise).permit :lesson_id, :user_id, :status
  end

  def load_excercise
    @excercise = Excercise.find_by id: params[:id]
    return if @excercise
    flash[:danger] = t ".not_found"
    redirect_to admin_excercises_path
  end
end
