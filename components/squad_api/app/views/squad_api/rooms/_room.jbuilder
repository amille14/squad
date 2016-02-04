json.(room, :id, :name, :description, :created_at, :is_editable, :is_public)
json.owner_id room.user_id

if @current_user.present?
  room_user = @user.for_room(room.id)
  json.room_user do
    json.(room_user, :id, :read_at, :created_at, :permissions)
  end
end