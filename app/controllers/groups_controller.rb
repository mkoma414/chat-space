class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @groups = Group.new
  end

  def create
    # binding.pry
    Group.create(create_params)
    redirect_to root_path
  end

  def edit
  end

  private
  def create_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
