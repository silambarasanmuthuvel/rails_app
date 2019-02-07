class Topic < ApplicationRecord
  has_many :posts , dependent: :destroy

  validates :name,presence:true ,length: { minimum: 3,maximum: 15,  message: "name should be of length 3 to 15 character" }

end
