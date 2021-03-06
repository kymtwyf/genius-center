class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  WillPaginate.per_page = 10
  
  def index
    @users = User.paginate(page: params[:page])
    render 'users/index'
  end


  def correct_user
    unless current_user.admin?
      flash[:warning] = 'Current user is NOT administrator'
      redirect_to login_path
    else
      flash[:notice] = "admin: #{current_user.user_name}"
    end
  end
end
