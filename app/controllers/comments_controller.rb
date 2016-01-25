class CommentsController < ApplicationController
  def create
    lesson = Lesson.find(params[:lesson_id])
    @comment = lesson.comments.create(comment_params.merge(user: current_user))

    respond_to do |format|
      format.html {redirect_to lesson}
      format.js { }
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
