class RatingsController < ApplicationController
  before_action :set_post, only: [:new,:create]
  def new
    @rating = @post.ratings.new
  end
  def create
    @rating = @post.ratings.new(rating_params)
    if @rating.save
      puts @rating.inspect
      redirect_to topic_post_path(@topic,@post)
    else
      redirect_to topic_path
    end
  end

  private

  def set_post
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
  end

  def rating_params
    params.permit(:rating)
  end

end
