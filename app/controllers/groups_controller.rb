class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    @groups = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
