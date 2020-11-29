class MessagesController < ApplicationController
  before_action :find_message_id, only: [:show, :edit, :update]
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

  def show
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to messages_url
    else
      render :edit
    end
  end

  private
  def message_params
    params.require(:message).permit(:name, :content)
  end

  def find_message_id
    @message = Message.find_by(id: params[:id])
  end
end
