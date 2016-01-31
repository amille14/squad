class Room < ApplicationRecord
  belongs_to :squad, inverse_of: :rooms
  has_one :owner, class_name: "User", inverse_of: :room

  has_many :posts, inverse_of: :room
  has_many :messages, inverse_of: :room
  has_many :users, through: :room_users
  has_many :room_users, inverse_of: :room
end
