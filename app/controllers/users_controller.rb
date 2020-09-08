class UsersController < ApplicationController
  before_action :authenticate_user!

  authorize_resource

  def index
    @users = User.all
  end
end
