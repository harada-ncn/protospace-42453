class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.new(comment_params)
    if @comment.save
      redirect_to prototype_path(params[:prototype_id])
    else
      @prototype= Prototype.find(params[:id])
      @comments = Prototype.find(params[:id]).comments
      @comment = Prototype.find(params[:id]).comments.new
      render "prototypes/show"
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end
end
