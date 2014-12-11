class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  respond_to :html, :js

  def new
    @topic = Topic.friendly.find(params[:topic_id])
    @comment = @topic.comments.build  
    respond_with(@comment)
  end

  def edit
    @topic = Topic.friendly.find(params[:topic_id])
  end

  def create
    topic = Topic.friendly.find(params[:topic_id])
    @comment = topic.comments.build(comment_params.merge(user_id: current_user.id))    
    @comment.save
    respond_with(topic.forum,topic)
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    topic = Topic.friendly.find(params[:topic_id])
    respond_with([topic.forum, topic])
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
