require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  before{
    @user = User.create!(email:"abc@gmail.com",password:"123456")
    sign_in @user
    @topic = Topic.create!(name:"sam") }
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

  it "is invalid without name for topic" do
    expect{ post :create, params: { topic: { name: "as" } } }.to change{ Topic.all.count }.by(0)
    expect(response).to render_template('new')
    expect(assigns(:topic).errors.messages).to match({:name=>["name should be of length 3 to 15 character"]})
    expect(assigns(:topic).errors.present?).to be true
  end

  it "is valid with name for topic" do
    expect{ post :create, params: { topic: { name: "asdsada" } } }.to change{ Topic.all.count }.by(1)
    expect(response).to redirect_to(topic_path(assigns(:topic)))
    expect(flash[:notice]).to eql('Topic was successfully created.')
  end

  context 'DELETE #Destroy' do
    it 'returns sucess ' do
      delete :destroy, params: {id:@topic.to_param}
      expect(response).to redirect_to(topics_path)
    end
  end
end
