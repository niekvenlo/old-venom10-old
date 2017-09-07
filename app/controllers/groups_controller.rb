class GroupsController < ApplicationController
  include SessionsHelper

  def show
    @group = Group.find(params[:id])
    # @group = current_user.groups.find(params[:id])
  end

  def edit
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = Group.new(whitelist_group_params)
    if @group.save
      @group.users << @user
      redirect_to @group, success: "Group created. You're the owner of this new group"
    else
      render :edit
    end
  end

  private
  def whitelist_group_params
    received_params = params.require(:group).permit(:id, :name, :about_group, :currency_type)
    received_params.merge(admin_id: current_user.id)
  end
end
