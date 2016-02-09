alt = require("../alt")

class MessageActions
  constructor: ->
    @generateActions "fetchList", "fetchSuccess", "fetchError"


module.exports = alt.createActions(MessageActions)