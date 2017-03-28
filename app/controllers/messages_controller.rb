class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @groups = Group.all
    @group = Group.find(params[:group_id])

    @user_list = ""

    @group.users.each do |user|
      @user_list = @user_list + user.name + " "
    end
  end
end
