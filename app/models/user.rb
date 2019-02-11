class User < ApplicationRecord
  has_many :comments
  has_many :posts , class_name: 'Post'
  has_and_belongs_to_many :post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
