class CommentsController < ApplicationController

  def create
    @comment = Comment.build_from(@message, current_user.id, comment_params)

    if @comment.save
      redirect_to message_path(@message)
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit([:body])
  end

  def find_message
    @message = Message.find(params[:message_id])
  end

end
