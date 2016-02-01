class Squad < ApplicationRecord
  has_many :users, through: :squad_users
  has_many :rooms, inverse_of: :squad
  has_many :squad_users, inverse_of: :squad
  has_many :posts, through: :rooms
  has_many :messages, through: :rooms

  has_one  :leader,  ->{ where(permissions: "leader") }, through: :squad_users, source: :user
  has_many :mods,    ->{ where(permissions: "mod") },    through: :squad_users, source: :user
  has_many :members, ->{ where(permissions: "member") }, through: :squad_users, source: :user
  has_many :readers, ->{ where(permissions: "reader") }, through: :squad_users, source: :user

  after_create :create_default_rooms

  def create_default_rooms
    # TODO: Come up with better default description copy.
    self.rooms.create!(name: "general", description: "A room for general discussion.", is_editable: false)

    if self.is_public
      self.rooms.create!(name: "public", description: "A window to the oustide world. This room is publicly accessible.", is_editable: false, is_public: true)
    end
  end

  def create_gender_specific_rooms
    # TODO: Come up with better default description copy.
    self.rooms.create!(name: "ladies' room", description: "A room for women only.")
    self.rooms.create!(name: "guys' room", description: "A room for men only.")
  end

  def add_user(user_id, permissions = :member)
    SquadUser.create!(squad_id: self.id, user_id: user_id, permissions: permissions)
  end
end
