class Post < ApplicationRecord
  validates :content, {presence:true, length: {maximum: 50}}
  validates :price, {presence:true, length: {maximum: 50}}
  validates :product_name, {presence:true, length: {maximum: 50}}
  belongs_to :user
end
