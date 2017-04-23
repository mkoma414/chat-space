class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new

    respond_to do |format|
      format.html
      format.json { render json: user_data }
    end
  end

  def create
    binding.pry
    Group.create(group_params)
    redirect_to root_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to root_path
  end

  private
  def group_params
    tmp_string = params[:group][:user_ids][0]
    tmp_array = tmp_string.split(",")
    tmp_array.push(current_user.id)
    params[:group][:user_ids]=tmp_array
    params.require(:group).permit(:name, user_ids:[])
  end

  def user_data
     Hash[User.all.map { |user| [user.id, user.name] }]

     user_data = []
     all_data = User.all
     all_data.each do |data|
       a_data = { id: data.id, name: data.name}
       user_data << a_data
     end
     user_data

  end
end
