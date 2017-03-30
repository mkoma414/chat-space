class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = Message.all
    @message = Message.new
  end

  def create
    redirect_to root_path
  end
end
