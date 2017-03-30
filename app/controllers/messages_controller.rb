class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = Message.where(group_id: params[:group_id], user_id: current_user.id)
    @message = Message.new
  end

  def create
    Message.create(message_params)
    redirect_to :back
  end

  def update
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(params.permit(:group_id)).merge(user_id: current_user.id)
  end
end
