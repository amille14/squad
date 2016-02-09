alt = require("../alt")

class SquadActions
  constructor: ->
    @generateActions "fetchItem", "fetchSuccess", "fetchError"


module.exports = alt.createActions(SquadActions)