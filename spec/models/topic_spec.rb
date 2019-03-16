require 'rails_helper'

RSpec.describe Topic, type: :model do

    subject{Topic.create!(name: "sas") }
    describe "validation" do
      it "vaild with the topic" do
        expect(subject).to be_valid
      end
      it "vaild with the not topic" do
        subject.name = nil
        expect(subject).not_to be_valid
      end
    end
    describe "topic destory" do
      it " vaildate the destroy topic function" do
        subject
        expect{subject.destroy}.to change{ Topic.count }.by(-1)
      end
    end
    describe "post create" do
      it " vaildate the new function" do
        subject
        expect(Topic.all.count).to eq(1)
      end
    end
  end