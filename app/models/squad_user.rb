class SquadUser < ApplicationRecord
  belongs_to :squad, inverse_of: :squad_users
  belongs_to :user, inverse_of: :squad_users

  # Reader - Read only
  # Member - Read, write
  # Mod    - Read, write, update, delete
  # Leader - Read, write, update, delete, super
  enum permissions: {reader: 0, member: 1, mod: 2, leader: 3}
end
