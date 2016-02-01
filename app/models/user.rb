class User < ApplicationRecord
  has_many :squads, through: :squad_users
  has_many :rooms, through: :room_users
  has_many :posts, inverse_of: :creator
  has_many :messages, inverse_of: :creator
  has_many :squad_users, inverse_of: :user
  has_many :room_users, inverse_of: :user
  has_many :post_users, inverse_of: :user

  belongs_to :room, inverse_of: :owner, required: false

  # For determining access to gender-specific rooms
  enum gender: {female: 0, male: 1, other: 2}

  after_create :create_personal_room

  def create_personal_room
    Room.create!(user_id: self.id, name: "@#{self.username}'s room", description: "@#{self.username}'s personal room.")
  end

  def room
    Room.where(user_id: self.id).first
  end

  def for_squad(squad_id)
    self.squad_users.where(squad_id: squad_id).first
  end

  def for_room(room_id)
    self.room_users.where(room_id: room_id).first
  end

  def for_post(post_id)
    self.post_users.where(post_id: post_id).first
  end
end
