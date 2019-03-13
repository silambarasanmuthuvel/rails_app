require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before{
    @user = User.create!(email:"abc@gmail.com",password:"123456")
    sign_in @user
    @topic = Topic.create!(name:"sam")

    @post = @topic.posts.create!(title: "bay" ,body: "bay of bengal",topic_id: @topic.id,user_id: @user.id)

  }
  context 'GET #index' do
    it 'returns sucess ' do
      get :index, params: {id:@post.to_param,topic_id:@topic.id}
      expect(response).to be_successful
    end
    end



  context 'GET #new' do
    it 'returns sucess ' do
      get :new ,params: {id:@post.to_param,topic_id:@topic.id}
      expect(response).to be_successful
    end
    it "the name must be with proper credentials" do
      expect{ post :create, params: { topic_id:1, post: {title: "by" ,body: "bay of bengal",topic_id:1,user_id: @user.id  } } }.to change{ Post.all.count }.by(0)
      expect(response).to render_template('new')
      expect(assigns(:post).errors.messages).to match({:title=>["title should be of length 3 to 20 character"]})
      expect(assigns(:post).errors.present?).to be true
    end
    it "the name must be with proper credentials" do
      expect{ post :create, params: { topic_id:1, post: {title: "bay" ,body: "bay of bengal",topic_id:1,user_id: @user.id  } } }.to change{ Post.all.count }.by(1)
      # expect(response).to render_template('topics/show')
      expect(assigns(:post).errors.present?).to be false
    end

  end


    context 'GET #show' do
    it 'returns sucess ' do
      get :show, params: {id:@post.to_param,topic_id:@topic.id}
      expect(response).to be_successful
    end
  end

  context 'GET #edit' do
    it 'returns sucess ' do
      get :edit, params: {id:@post.to_param,topic_id:@topic.id}
      expect(response).to be_successful
    end
  end

  context 'DELETE #Destroy' do
    it 'returns sucess ' do
      delete :destroy, params: {id:@post.to_param,topic_id:@topic.id}
      expect(response).to redirect_to(topic_posts_path)
    end
  end
end

