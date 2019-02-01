class PostsController < ApplicationController

  before_action :set_topic
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  # before_action :set_topic, only: [:new,:create]
  # GET /posts
  # GET /posts.json
  def index
    # @topic = Topic.find(params[:topic_id])
    if params[:topic_id].blank?
      @posts = Post.all.paginate(page: params[:page], per_page: 5).includes(:topic)
    else
      @posts = @topic.posts.all.paginate(page: params[:page], per_page: 5)
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments =@post.comments.all
    @comment = @post.comments.new
    @rating = @post.ratings.all
    @group_rating = @rating.order(:rating).group(:rating).count
  end

  # GET /posts/new
  def new
    @post = @topic.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  def create
    @post = @topic.posts.create(post_params)
    if @post.save
      redirect_to topic_posts_path
    else
      respond_to do |format|
        format.html { render :new, notice:"fgfhgf" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to topic_posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy

    respond_to do |format|
      if @post.destroy
        format.html { redirect_to topic_posts_path, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end

    end
  end

  private
  def set_topic
    unless params[:topic_id].blank?
      @topic = Topic.find(params[:topic_id])
    end
  end

  #  Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = @topic.posts.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title ,:body ,:image , tags_attributes: [:tag] )
  end
end

