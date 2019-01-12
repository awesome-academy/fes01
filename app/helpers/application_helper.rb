module ApplicationHelper
  def full_title page_title = ""
    base_title = I18n.t "layouts.application.title"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def find_user id
    @user = User.find_by id: id
    @user.present? ? @user.name : id
  end
end
