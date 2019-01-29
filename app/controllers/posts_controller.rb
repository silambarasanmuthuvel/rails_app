class PostsController < ApplicationController
  
  before_action :set_topic, only: [ :index ,:new,:create, :show, :edit, :update, :destroy, :index]
  # before_action :set_topic, only: [:new,:create]
  # GET /posts
  # GET /posts.json
  def index
    # @topic = Topic.find(params[:topic_id])
    if params[:topic_id].blank?
    @posts = Post.all.paginate(page: params[:page], per_page: 5)
    else
      @posts = @topic.posts.all.paginate(page: params[:page], per_page: 5)
    end
    end

  # GET /posts/1
  # GET /posts/1.json
  def show
          @topic = Topic.find(params[:topic_id])
       #   puts @topic.posts
           @post = @topic.posts.find(params[:id])
          @comments =@post.comments.all
  end

  # GET /posts/new
  def new
    @post = @topic.posts.new
    puts @post
  end

  # GET /posts/1/edit
  def edit
    @post = @topic.posts.find(params[:id])
    puts @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @topic.posts.create(post_params)
    @post.save
    redirect_to topic_posts_path
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json0
  def update
    @post = @topic.posts.find(params[:id])
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
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to topic_posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_topic
    if !params[:topic_id].blank?
      @topic = Topic.find(params[:topic_id])
    end
    end
   #  Use callbacks to share common setup or constraints between actions.
   def set_post
      @post = @topic.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title ,:body)
    end
end

