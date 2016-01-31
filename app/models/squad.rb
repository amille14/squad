class Squad < ApplicationRecord
  has_many :users, through: :squad_users
  has_many :rooms, inverse_of: :squad
  has_many :squad_users, inverse_of: :squad
  has_many :posts, through: :rooms
  has_many :messages, through: :rooms
end
