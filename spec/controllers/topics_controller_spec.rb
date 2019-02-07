require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  before{@topic = Topic.create!(name:"sam") }
  context 'GET #index' do
    it 'returns sucess ' do
      get :index
      expect(response).to be_successful
    end
  end


  context 'GET #new' do
    it 'returns sucess ' do
      get :new
      expect(response).to be_successful
    end
  end

  context 'GET #show' do
    it 'returns sucess ' do
      get :show, params: {id:@topic.to_param}
      expect(response).to be_successful
    end
  end

  context 'GET #edit' do
    it 'returns sucess ' do
      get :edit, params: {id:@topic.to_param}
      expect(response).to be_successful
    end
  end

  context 'DELETE #Destroy' do
    it 'returns sucess ' do
      delete :destroy, params: {id:@topic.to_param}
      expect(response).to redirect_to(topics_path)
    end
  end
end
