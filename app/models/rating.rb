class Rating < ApplicationRecord
  belongs_to :post, optional: true
  has_many :user_comment_ratings
  has_many :comments, through: :user_comment_ratings , source: :comment
  has_many :users, through: :user_comment_ratings, source: :user
  validates :rating,  :numericality => { greater_than_or_equal_to: 0, less_than: 6 }

end
