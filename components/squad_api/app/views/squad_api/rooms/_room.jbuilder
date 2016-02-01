json.(room, :id, :name, :description, :created_at, :is_editable, :is_public)
json.owner_id room.user_id