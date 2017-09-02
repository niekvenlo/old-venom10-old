class UsersController < ApplicationController
  #before_action :current_user, only: [:edit, :update, :destroy]
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Venom!"
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(whitelist_user_params)
        format.html { redirect_to @user, success: 'Profile updated' }
      else
        format.html { render :edit }
        format.js { render :update }
      end
    end
  end
  
  def destroy
  end
  
  private
  def whitelist_user_params
    params.require(:user).permit(:id, :name, :nickname, :about_me, :email)
  end
  
  
end
