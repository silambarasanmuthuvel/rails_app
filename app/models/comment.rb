class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :user_comment_ratings
  has_many :ratings, through: :user_comment_ratings, source: :rating
  has_many :users, through: :user_comment_ratings , source: :user



  validates :commenter,presence: true , length: { minimum: 3,maximum: 15,  message: "name should be of length 3 to 15 character" }
  validates :body,presence: true , length: { minimum: 3,maximum: 15,  message: "body should be of length 5 to 50 character" }
end
