require 'time'

class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @current_group = Group.includes(:messages).find(params[:group_id])
    @message = Message.new

    respond_to do |format|
      format.html
      format.json { render json: new_message }
    end
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.json { render json: message_data }
      end
    else
      flash[:alert] = @message.errors.full_messages[0].sub(/"/, "")
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def message_data
    {user_name: @message.user.name,
     date: @message.created_at.in_time_zone('Asia/Tokyo').strftime('%Y/%m/%d %H:%M:%S'),
     body: @message.body}
  end

  def new_message
    start_time = Time.at(params.dig(:last_update, :date).to_i)
    new_message = Message.created_after(start_time).group_no(params[:group_id].to_i)

    new_message_data = []
    i=0
    new_message.each do |message|
      tmp_hash = { text: message.body, name: message.user.name, image: message.image.url, create_date: message.created_at.in_time_zone('Asia/Tokyo').strftime('%Y/%m/%d %H:%M:%S') }
      new_message_data[i] = tmp_hash
    end
    new_message_data
  end

end
