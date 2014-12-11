class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @forum = Forum.find(params[:forum_id])
    @topics = @forum.topics
    respond_with(@topics)
  end

  def show
    @comments = @topic.comments
    respond_with(@topic)
  end

  def new
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.new
    respond_with(@topic)
  end

  def edit
  end

  def create
    forum = Forum.find( params[:forum_id])
    topic = forum.topics.build(topic_params)
    topic.save
    respond_with(:forum, :topics)
  end

  def update
    @topic.update(topic_params)
    respond_with(@topic)
  end

  def destroy
    @topic.destroy
    respond_with(@topic)
  end

  private
    def set_topic
      @topic = Topic.friendly.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:subject)
    end
end
