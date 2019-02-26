class PostsController < ApplicationController

  before_action :set_topic
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  # before_action :authorize_resource, only: [:update, :destroy, :edit ]
  load_and_authorize_resource except: [:read_status , :index , :show]

<%= form_for(resource, as: resource_name, url: registration_path(resource_name), html: { method: :put }) do |f| %>
  <%= render "devise/shared/error_messages", resource: resource %>

  <div class="field">
    <%= f.label :email %><br />
    <%= f.email_field :email, autofocus: true, autocomplete: "email" %>
  </div>

  def create
    @post = @topic.posts.create(post_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @post.save
        format.html { redirect_to topic_posts_path }
        format.js
      else
        format.html { render :new, notice:"fgfhgf" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def readstatus
    respond_to do |format|
      unless @post.users.include?(current_user)
        @post.users << current_user
      end
      format.js
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
    params.require(:post).permit(:title ,:body ,:image , tags_attributes: [:tag], tags: :tag )
  end
end

