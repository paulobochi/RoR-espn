class MessagesController < ApplicationController

  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def messages_params
    params.required(:message).permit(:title, :description)
  end

  def find_message
    @message = Message.find(params[:id])
  end

end
