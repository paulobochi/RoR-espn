class MessagesController < ApplicationController

  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order('created_at DESC')
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(messages_params)

    if @message.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @message.update(messages_params)
      redirect_to @message
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path
  end

  private

  def messages_params
    params.required(:message).permit(:title, :description)
  end

  def find_message
    @message = Message.find(params[:id])
  end

end
