class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments , dependent: :destroy
  has_many :ratings , dependent: :destroy


  validates :title,presence:true ,length: { minimum: 3,maximum: 15,  message: "title should be of length 3 to 15 character" }
  validates :body,presence:true ,length: { minimum: 4,maximum: 100,  message: "body should be of length 4 to 100 character" }
end
