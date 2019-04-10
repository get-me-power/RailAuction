class Post < ApplicationRecord
  validates :content, {presence:true}
  validates :price, {presence:true}
  validates :product_name, {presence:true}
end
