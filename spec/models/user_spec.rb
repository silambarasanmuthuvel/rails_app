require 'rails_helper'

RSpec.describe User, type: :model do
  subject{ described_class.create!(email:"abc@gmail.com",password:"123456") }

  describe "user to be valid" do
    it "not valid without email" do
      subject.email=nil
      expect(subject).not_to be_valid
    end

    it "valid " do
      expect(subject).to be_valid
    end
    it "not valid without password" do
      subject.password=nil
      expect(subject).not_to be_valid
    end

  end
end