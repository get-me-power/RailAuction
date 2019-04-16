class User < ApplicationRecord
  validates :name, confirmation: true
end
