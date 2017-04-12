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
    Group.create(group_params)
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
    tmp = params.require(:group).permit(:name, user_ids:[])
    if(tmp[:user_ids])
      tmp[:user_ids].push(current_user.id)
      tmp
    else
      tmp.merge({ user_ids: [current_user.id] })
      tmp
    end
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
