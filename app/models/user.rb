class User < ApplicationRecord
  validates :name, {presence: true, length: {maximum: 50}}
  validates :password, {presence: true, length: {maximum: 50}}
  validates :password, {presence: true, length: {minimum: 7}}
  validates :email, {uniqueness: true, presence: true}

  has_many :active_relationships,
    class_name: 'Relationship',
    foreign_key: :follower_id,
    dependent: :destroy

  has_many :passive_relationships,
    class_name: 'Relationship',
    foreign_key: :followed_id,
    dependent: :destroy

  has_many :following,
    through: 'active_relationships',
     source: 'followed'

  has_many :followers,
    through: 'passive_relationships',
     source: 'follower'

  def follow(other_user)
    self.active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    self.active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    self.following.include?(other_user)
  end

  has_secure_password

end
