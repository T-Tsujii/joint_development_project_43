class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_url
    else
      render :new
    end
  end

  def index
    @messages = Message.all
  end

  private
  def message_params
    params.require(:message).permit(:name, :content)
  end
end