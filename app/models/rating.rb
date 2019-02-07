class Rating < ApplicationRecord
  belongs_to :post
  validates :rating,  :numericality => { greater_than_or_equal_to: 0, less_than: 6 }

end
