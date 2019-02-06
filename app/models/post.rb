class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments , dependent: :destroy
  has_many :ratings , dependent: :destroy
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
  belongs_to :user
  has_and_belongs_to_many :users
  validates :title,presence:true ,length: { minimum: 3,maximum: 15,  message: "title should be of length 3 to 15 character" }
  validates :body,presence:true ,length: { minimum: 4,maximum: 100,  message: "body should be of length 4 to 100 character" }

  has_attached_file :image , styles: { medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :image , content_type: /\Aimage\/.*\z/
end
