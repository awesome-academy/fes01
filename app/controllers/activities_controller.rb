class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    following =
      Activity.activities_current_user(current_user.following.map(&:id))
    @activities =
      Activity.activities_current_user(current_user.id).or(following)
    @activities = @activities.sort_by_created
  end
end
