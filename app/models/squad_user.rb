class SquadUser < ApplicationRecord

  # Reader - Read only
  # Member - Read, write
  # Mod    - Read, write, update, delete
  # Leader - Read, write, update, delete, super
  enum permissions: {reader: 0, member: 1, mod: 2, leader: 3}
end
