class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @current_group = Group.includes(:messages).find(params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save
    if @message.errors.any?
      flash[:alert] = @message.errors.full_messages[0].sub(/"/, "")
    end
    # redirect_to :back
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
