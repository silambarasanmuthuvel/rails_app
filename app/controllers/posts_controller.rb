class PostsController < ApplicationController

  before_action :set_topic, except: :index
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  # before_action :authorize_resource, only: [:update, :destroy, :edit ]
  load_and_authorize_resource
  def index
    if params[:topic_id].blank?
      @posts = Post.all.paginate(page: params[:page], per_page: 5).includes(:topic ,:user )
    else
      @posts = @topic.posts.all.paginate(page: params[:page], per_page: 5)
    end
  end

  def show
    @comments =@post.comments.all.includes(:user)
    @comment = @post.comments.new
    @rating = @post.ratings.all
    @group_rating = @rating.order(:rating).group(:rating).count
    @tag=Tag.all
  end

  def new
    @post = @topic.posts.new
  end

  def edit
  end

  def create
    @post = @topic.posts.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to topic_posts_path
    else
      respond_to do |format|
        format.html { render :new, notice:"fgfhgf" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params.merge(user_id: current_user.id))
        format.html { redirect_to topic_posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def set_post
    @post = @topic.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title ,:body ,:image , tags_attributes: [:tag] )
  end
end

