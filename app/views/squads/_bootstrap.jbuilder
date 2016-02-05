json.current_user do
  json.partial! 'squad_api/users/user', user: user
end

json.squad do
  json.partial! 'squad_api/squads/squad', squad: squad
end

json.rooms do
  json.partial! 'squad_api/rooms/room', collection: rooms, as: :room
end

