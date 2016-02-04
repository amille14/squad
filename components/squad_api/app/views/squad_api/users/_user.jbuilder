json.(user, :id, :username, :email, :first_name, :last_name)

if @squad.present?
  squad_user = user.for_squad(@squad.id)
  json.squad_user do
    json.(squad_user, :id, :title, :cred, :permissions)
  end
end