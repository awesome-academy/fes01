class Admin::CsvController < AdminController
  def create
    Question.import params[:file]
    flash[:success] = t ".note_import"
    redirect_to admin_questions_path
  end
end
