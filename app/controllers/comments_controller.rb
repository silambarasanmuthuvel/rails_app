class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments =@post.comments.all
  end

  # GET /comments/1
  # GET /comments/1.jso
  def show

    if params[:post_id].blank?
      @comment=@post.all
    else
      @comment=@post.comments.find(params[:id])
    end
  end

  # GET /comments/new
  def new
    @comment = @post.comments.new
  end

  # GET /comments/1/edit
  def edit
    @comment=@post.comments.find(params[:id])
    puts @comment
  end

  # POST /comments
  # POST /comments.json
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

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
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

  # DELETE /comments/1
  # DELETE /comments/1.json
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
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
  end
  def set_comment
    @comment = @post.comments.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:commenter,:body)
  end
end
