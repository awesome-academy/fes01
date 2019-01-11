class AdminController < ApplicationController
  layout "admin/application"
  before_action :authenticate_user!, :admin_user

  include ExcercisesHelper
end
