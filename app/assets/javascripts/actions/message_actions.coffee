alt = require("../alt")

class MessageActions
  constructor: ->
    @generateActions "fetchList", "fetchListSuccess", "fetchListError"


module.exports = alt.createActions(MessageActions)