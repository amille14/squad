ItemSource = require('./item_source')
actions = require('../actions/squad_actions')

url = =>
  squadId = Squadd.getSquad()?.id
  url = "/squads/#{squadId}"
  return url

SquadSource = _.extend ItemSource(url, actions)


module.exports = SquadSource