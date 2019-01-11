class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def admin_user
    redirect_to root_path unless current_user.admin?
  end

  def load_questions lesson_id
    rand_questons = Question.all_questons(lesson_id).order("RAND()")
    @questions = rand_questons.limit(Settings.excercises.randum_numer)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :phone, :role]
  end
end
