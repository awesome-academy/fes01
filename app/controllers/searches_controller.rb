class SearchesController < ApplicationController
  def index
    @lessions = Lesson.all
    render json: {status: Settings.searches.status, data: @lessions}
  end
end
