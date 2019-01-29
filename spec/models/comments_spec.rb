require 'rails_helper'

RSpec.describe Comment, type: :model do

  before{
    @topic = Topic.create(name:"topic")
    @post = @topic.posts.create(title:"sadas",body:"sdas")
  }

  subject{ described_class.create(commenter:"sadas",body:"sdsa",post_id:1) }
  describe "dasdas" do
    it "vaild with the comment" do
      expect(subject).to be_valid
    end
    it "not valid without body" do
      subject.body = nil
      expect(subject).not_to be_valid
    end
    it "not valid without commenter" do
      subject.commenter = nil
      expect(subject).not_to be_valid
    end
  end
  describe "comment destory" do
    it " vaildate the destroy topic function" do
      subject
      expect{subject.destroy}.to change{ Comment.count }
    end
  end
  describe "post create" do
    it " vaildate the new function" do
      subject
      expect(Comment.all.count).to eq(1)
    end
  end

end