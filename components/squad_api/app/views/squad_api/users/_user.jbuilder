json.(user, :id, :username, :first_name, :last_name)

if user == @current_user
  json.email @current_user.email
end

if @squad.present?
  squad_user = user.for_squad(@squad.id)

  if squad_user
    json.squad_user do
      json.(squad_user, :id, :title, :cred, :permissions)
    end
  end
end