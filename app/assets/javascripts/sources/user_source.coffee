CollectionSource = require('./collection_source')
ItemSource = require('./item_source')
actions = require('../actions/user_actions')

url = (id) =>
  squadId = Squadd.getSquad()?.id
  url = "/squads/#{squadId}/users"
  url += "/#{id}" if id?
  return url

UserSource = _.extend ItemSource(url, actions), CollectionSource(url, actions)


module.exports = UserSource