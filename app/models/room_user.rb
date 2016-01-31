class RoomUser < ApplicationRecord
  belongs_to :room, inverse_of: :room_users
  belongs_to :user, inverse_of: :room_users
end
