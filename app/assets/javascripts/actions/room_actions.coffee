alt = require("../alt")

class RoomActions
  constructor: ->
    @generateActions "fetchList", "fetchItem", "fetchSuccess", "fetchError"


module.exports = alt.createActions(RoomActions)