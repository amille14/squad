CollectionSource = require('./collection_source')
ItemSource = require('./item_source')
actions = require('../actions/post_actions')

url = (id) =>
  squadId = Squadd.getSquad()?.id
  userId  = Squadd.getCurrentId("user")
  roomId  = Squadd.getCurrentId("room")

  if squadId?
    url = "/squads/#{squadId}/rooms/#{roomId}"
  else
    url = "/users/#{userId}/room"
  url += "/posts"
  url += "/#{id}" if id?

  return url

PostSource = _.extend CollectionSource(url, actions), ItemSource(url, actions)


module.exports = PostSource