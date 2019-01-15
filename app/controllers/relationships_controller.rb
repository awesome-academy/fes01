class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_relationship, only: :destroy
  before_action :load_user, only: :create

  def create
    current_user.follow @user
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  def destroy
    @user = @relationship.followed
    current_user.unfollow @user
    @activity = PublicActivity::Activity.find_by trackable_id: params[:id],
      trackable_type: controller_path.classify
    @activity.destroy
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:followed_id]
    return if @user
    flash[:danger] = t "relationship.load_user.error_message"
    redirect_to root_path
  end

  def load_relationship
    @relationship = Relationship.find_by id: params[:id]
    return if @relationship
    flash[:danger] = t "relationship.load_relationship.error_message"
    redirect_to root_path
  end
end
