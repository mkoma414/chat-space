class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @current_group = Group.includes(:messages).find(params[:group_id])
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
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
