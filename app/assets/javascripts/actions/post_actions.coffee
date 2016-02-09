alt = require("../alt")

class PostActions
  constructor: ->
    @generateActions "fetchList", "fetchItem", "fetchSuccess", "fetchError"


module.exports = alt.createActions(PostActions)