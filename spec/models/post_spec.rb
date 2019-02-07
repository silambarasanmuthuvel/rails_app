require 'rails_helper'

RSpec.describe Post, type: :model do
  before{ Topic.create!(name:"21321")
  }
  subject{ Post.create!(title:"dasd",body:"sdasdas",topic_id:1)}

  describe "validaton" do
      it "is not valid with no attributes" do
      subject.title=nil
      subject.body=nil
        expect(subject).not_to be_valid
      end
      it "is not valid without a title" do

        subject.title=nil
        expect(subject).not_to be_valid
      end
      it "is not valid without a body" do
        subject.body=nil
        expect(subject).not_to be_valid
      end
      it "is vaild with the name" do
        expect(subject).to be_valid
      end

  end
  describe "post destory" do
    it " vaildate the destroy function" do
      subject
      expect{subject.destroy}.to change{ Post.count }
    end
  end
  describe "post create" do
    it " vaildate the new function" do
       subject
      # expect{subject.create(title:"dasd",body:"sdasdas",topic_id:1)}.to change{ Post.count }
    expect(Post.all.count).to eq(1)
    end
  end
end
