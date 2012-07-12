class AdminController < ApplicationController
  before_filter do
    redirect_to root_path unless current_user.try(:admin?)
  end

  def index
    @users = User.all
  end

  def new_user
    @user = User.new
  end

  def create_user
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user #{@user.email}"
      redirect_to admin_path
    else
      flash[:error] = "Could not create new user."
      redirect_to new_user_path
    end
  end
end
