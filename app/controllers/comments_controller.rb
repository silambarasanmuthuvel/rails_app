class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]


  def index
    @comments =@post.comments.all
  end

  def show

    if params[:post_id].blank?
      @comment=@post.all
    else
      @comment=@post.comments.find(params[:id])
    end
  end

  def new
    @comment = @post.comments.new
  end

  def edit
    @comment=@post.comments.find(params[:id])
    puts @comment
  end

  def create
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_post_path(params[:topic_id],params[:post_id]), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to topic_post_path(params[:topic_id],params[:post_id]), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if  @comment.destroy
        format.html { redirect_to topic_post_path(params[:topic_id],params[:post_id]), notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_post
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
  end
  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commenter,:body)
  end
end
