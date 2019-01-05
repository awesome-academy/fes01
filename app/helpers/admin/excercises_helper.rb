module Admin::ExcercisesHelper
  def find_lesson id
    @lesson = Lesson.find_by id: id
    @lesson.present? ? @lesson.name : id
  end

  def find_user id
    @user = User.find_by id: id
    @user.present? ? @user.name : id
  end
end
