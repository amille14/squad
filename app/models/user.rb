class User < ApplicationRecord
  has_many :squads, through: :squad_users
  has_many :rooms, through: :room_users
  has_many :posts, inverse_of: :creator
  has_many :messages, inverse_of: :creator
  has_many :squad_users, inverse_of: :user
  has_many :room_users, inverse_of: :user
  has_many :post_users, inverse_of: :user

  belongs_to :room, inverse_of: :owner
end
