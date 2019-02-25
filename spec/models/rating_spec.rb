require 'rails_helper'

RSpec.describe Rating, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before{
    @topic = Topic.create(name:"topic")
    @post = @topic.posts.create(title:"sadas",body:"sdas")
  }
  subject{ described_class.create(rating:4,post_id:1) }

  describe "rating to be valid" do
    it "vaild " do
      expect(subject).to be_valid
    end
    it "Invaild without rating" do
      subject.rating =nil
      expect(subject).not_to be_valid
    end
  end
end
