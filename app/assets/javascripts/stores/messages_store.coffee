alt = require("../alt")
MessageActions = require("../actions/message_actions")
MessageSource = require("../sources/message_source")

class MessagesStore
  constructor: ->
    @state =
      list: []
      errors: null

    @registerAsync(MessageSource)

    @bindListeners
      onFetchList:        MessageActions.FETCH_LIST
      onLoading:          MessageActions.LOADING
      onFetchListSuccess: MessageActions.FETCH_LIST_SUCCESS
      onFetchListError:   MessageActions.FETCH_LIST_ERROR

  onFetchList: (postId) ->
    console.log "FETCH"
    @getInstance().fetchList() unless @getInstance().isLoading()

  onLoading: ->
    console.log "LOADING"
    @state.list = []
    @state.errors = null

  onFetchListSuccess: (messages) ->
    console.log "SUCCESS", messages
    @state.list = messages
    @state.errors = null

  onFetchListError: (response) ->
    console.log "ERROR", response
    @state.errors = response

module.exports = alt.createStore MessagesStore, "MessagesStore"