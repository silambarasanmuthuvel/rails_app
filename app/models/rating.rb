class Rating < ApplicationRecord
  belongs_to :post, optional: true
  has_many :comment
  has_many :user_comment_ratings
  has_many :comment, through: :user_comment_ratings
  has_many :user, through: :user_comment_ratings
  validates :rating,  :numericality => { greater_than_or_equal_to: 0, less_than: 6 }

end
