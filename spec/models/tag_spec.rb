silambarasansilambarasan007@gmail.comrequire 'rails_helper'

RSpec.describe Tag, type: :model do
  subject{ described_class.create!(tag:"new")}
  describe "tag model" do
    it 'valid for tag' do
      subject
      expect(subject).to be_valid
    end
    it 'not valid for tag' do
      subject.tag=nil
      expect(subject).to be_valid
    end

  end
end