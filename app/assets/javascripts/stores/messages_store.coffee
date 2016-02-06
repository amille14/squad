alt = require("../alt")
actions = require("../actions/message_actions")

class MessagesStore
  constructor: ->
    @messages = []
    @errors = null

    @bindListeners
      handleFetch:  actions.FETCH
      handleUpdate: actions.UPDATE
      handleError:  actions.ERROR

  # Reset messages to empty while fetching so view knows to render loading spinner
  handleFetch: ->
    console.log "FETCH"
    @messages = []
    @errors = null

  # Update the store and unset errors
  handleUpdate: (messages) ->
    console.log "UPDATE", messages
    @messages = messages
    @errors = null

  # Set errors
  handleError: (response) ->
    console.log "ERROR", response
    @errors = response

module.exports = alt.createStore MessagesStore, "MessagesStore"