alt = require("../alt")
CollectionStore = require("./collection_store")
MessageActions = require("../actions/message_actions")
MessageSource = require("../sources/message_source")

class MessagesStore extends CollectionStore
  constructor: ->
    super(MessageSource, MessageActions)
    @_indexes.push "post_id", "room_id"
    

module.exports = alt.createStore MessagesStore, "MessagesStore"