alt = require("../alt")
actions = require("../actions/message_actions")

class MessagesStore
  constructor: ->
    @messages = []
    @errors = null

    @bindListeners
      handleFetch: actions.fetch
      handleUpdate: actions.update
      handleFetchError: actions.fetchError

  # Reset messages to empty while fetching so view knows to render loading spinner
  handleFetch: ->
    console.log "FETCH"
    @messages = []
    @errors = null

  # Update the store and unset errors
  handleUpdate: (response) ->
    console.log "UPDATE", response
    @messages = response
    @errors = null

  # Set errors
  handleFetchError: (response) ->
    console.log "FETCH ERROR", response
    @errors = response

module.exports = alt.createStore MessagesStore, "MessagesStore"