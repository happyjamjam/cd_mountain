class Admin::UsersController < Admin::ApplicationController
  def index
  	@users = User.page(params[:page]).per(50)
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end
end
