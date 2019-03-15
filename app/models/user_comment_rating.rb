class UserCommentRating < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  belongs_to :rating
end
