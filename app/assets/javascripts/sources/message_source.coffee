CollectionSource = require('./collection_source')
actions = require('../actions/message_actions')

url = =>
  squadId = Squadd.getSquad()?.id
  userId  = Squadd.getCurrentId("user")
  roomId  = Squadd.getCurrentId("room")
  postId  = Squadd.getCurrentId("post")

  if squadId?
    url = "/squads/#{squadId}/rooms/#{roomId}"
  else
    url = "/users/#{userId}/room"
  url += "/posts/#{postId}" if postId?
  url += "/messages"

  return url

MessageSource = CollectionSource(url, actions)

# local: (state) ->
#   roomId = Squadd.getCurrentId("room")
#   postId = Squadd.getCurrentId("post")
#   if postId?
#     list = state.by["post_id"]?[postId]
#   else
#     list = state.by["room_id"]?[roomId]
#   if typeof(list) is "object" then return list else return null


module.exports = MessageSource