class UserController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.excludes(:id => current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    # Only admins can create new users
    if current_user.admin?
      @user = User.new(params[:user])
      if @user.save
        flash[:notice] = "Successfully created User."
      else
        flash[:error] = "Could not create new user."
      end
      redirect_to admin_path
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to admin_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to admin_path
    end
  end
end
