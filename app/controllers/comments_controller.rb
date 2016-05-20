class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_message, only: [:create, :edit, :update, :destroy]
  before_action :find_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.build_from(@message, current_user.id, comment_params[:body])

    if @comment.save
      redirect_to message_path(@message)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to message_path(@message)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to message_path(@message)
  end

  private

  def comment_params
    params.require(:comment).permit([:body])
  end

  def find_message
    @message = Message.find(params[:message_id])
  end

  def find_comment
    @comment = @message.comment_threads.find_by(id: params[:id], user: current_user.id)
  end

end
