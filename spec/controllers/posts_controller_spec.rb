require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before{@topic = Topic.create!(name:"sam")
      @post = @topic.posts.create!(title: "bay" ,body: "bay of bengal")
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

