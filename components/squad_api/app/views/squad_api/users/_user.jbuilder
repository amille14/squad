json.(user, :id, :username, :email, :first_name, :last_name)

if @squad.present?
  squad_user = user.for_squad(@squad.id)
  json.title squad_user.title
  json.cred squad_user.cred
  json.permissions squad_user.permissions
end