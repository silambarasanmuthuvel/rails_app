class RatingsController < ApplicationController
  before_action :set_post, only: [:new,:create]
  def new
    @rating = @post.ratings.new
  end
  def create
    if params[:com].present?
      @rat=Rating.create!(rating: params[:rating])

      UserCommentRating.create!(user_id: current_user.id , comment_id: params[:com], rating_id: @rat.id )
    else
      @rating = @post.ratings.create!(rating_params)
    end
    # if @rating.save
    redirect_to topic_post_path(@topic,@post)
    # else
    #   redirect_to topic_path
  end

  def destroy
    @rating = Rating.find(params[:id])
    puts "!!!!!!!!!!!!!!!!!"
    if @rating.destroy
      format.html { redirect_to topic_post_path(params[:topic_id],params[:post_id]), notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    else
      format.json { render json: @rating.errors, status: :unprocessable_entity }
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
