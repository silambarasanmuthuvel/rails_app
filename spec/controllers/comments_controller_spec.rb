require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before{@topic = Topic.create!(name:"sam")
  @user = User.create!(email:"abc@gmail.com",password:"123456")
  sign_in @user
  @post = @topic.posts.create!(title: "bay" ,body: "bay of bengal",topic_id:1,user_id: @user.id)
  @comment=@post.comments.create!(commenter: "sam" ,body: "good boy",user_id: @user.id)

  }
  context 'GET #index' do
    it 'returns sucess ' do
      get :index, params: {id:@comment.to_param,post_id:@post.id,topic_id:@topic.id}
      expect(response).to be_successful
    end
  end


  context 'GET #new' do
    it 'returns sucess ' do
      get :new, params: {id:@comment.to_param,post_id:@post.id,topic_id:@topic.id}
      expect(response).to be_successful
    end
    it "the name must be with proper credentials" do
      expect{ post :create, params: { topic_id:1,post_id:1, comment: { commenter: "sad" ,body: "good boy",post_id:1,user_id: @user.id  } } }.to change{ Comment.all.count }.by(1)
      expect(response).to redirect_to(topic_post_path(@topic.id,@post.id))
      expect(flash[:notice]).to eq('Comment was successfully created.')
      # expect(assigns(:comment).errors.present?).to be false
    end

  end

  context 'GET #show' do
    it 'returns sucess ' do
      get :show, params: {id:@comment.to_param,post_id:@post.id,topic_id:@topic.id}
      expect(response).to be_successful
    end
  end

  context 'GET #edit' do
    it 'returns sucess ' do
      get :edit, params: {id:@comment.to_param,post_id:@post.id,topic_id:@topic.id}
      expect(response).to be_successful
    end
  end

  context 'DELETE #Destroy' do
    it 'returns sucess ' do
      delete :destroy, params:{id:@comment.to_param,post_id:@post.id,topic_id:@topic.id}
      expect(response).to redirect_to(topic_post_path)
    end
  end
end

