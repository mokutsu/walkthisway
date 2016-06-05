class CommentsController < ApplicationController
  before_action :load_walk

  def create
    @comment = @walk.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.walk_id = params[:walk_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to walk_path(@walk.id) }
        format.js {}
      else
        format.html { render 'walks/show', alert: "there was an error"}
        format.js {}
      end
    end
  end
  #
  # def edit
  #   @comment = Comment.find(params[:id])
  # end
  #
  # def update
  #   if @comment.update_attributes(comment_params)
  #     flash[:alert] = "Comment updated!"
  #     redirect_to walks_show_path(params[:walk_id])
  #   else
  #     render :edit
  #   end
  #
  # end

  def destroy
    @comment = Comment.find(params[:id])
    @walk = Walk.find(@comment.walk_id)
    @comment.destroy
    redirect_to walk_path(@walk)
  end

private

  def comment_params
    params.require(:comment).permit(:walk_id, :comment)
  end

  def load_walk
    @walk = Walk.find(params[:walk_id])
  end
end
