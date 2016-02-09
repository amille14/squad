CollectionSource = require('./collection_source')
ItemSource = require('./item_source')
actions = require('../actions/room_actions')

url = (id) =>
  squadId = Squadd.getSquad()?.id
  userId  = Squadd.getCurrentId("user")

  if squadId?
    url = "/squads/#{squadId}/rooms"
    url += "/#{id}" if id?
  else
    url = "/users/#{userId}/room"

  return url

RoomSource = _.extend CollectionSource(url, actions), ItemSource(url, actions)


module.exports = RoomSource