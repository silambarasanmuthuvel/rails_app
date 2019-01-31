class Comment < ApplicationRecord
  belongs_to :post

  validates :commenter,presence: true , length: { minimum: 3,maximum: 15,  message: "name should be of length 3 to 15 character" }
  validates :body,presence: true , length: { minimum: 3,maximum: 15,  message: "body should be of length 5 to 50 character" }
end
