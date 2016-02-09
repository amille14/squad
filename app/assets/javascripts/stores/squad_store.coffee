alt = require("../alt")
actions = require("../actions/squad_actions")
source = require("../sources/squad_source")

class SquadStore
  constructor: ->
    @id = null
    @name = null
    @errors = null
    @loadingCount = 0

    @bindListeners
      onFetchItem:    actions.FETCH_ITEM
      onFetchSuccess: actions.FETCH_SUCCESS
      onFetchError:   actions.FETCH_ERROR

    @registerAsync(source)


  # Util Methods
  #===================

  isLoading: ->
    @loadingCount > 0


  # Action Handlers
  #===================

  onFetchItem: (id) ->
    console.log "FETCH ITEM", id
    @loadingCount += 1
    @getInstance().fetchItem(id)

  onFetchSuccess: (response) ->
    console.log "SUCCESS", response
    @id = response.id
    @name = response.name
    @errors = null
    @loadingCount -= 1

  onFetchError: (response) ->
    console.log "ERROR", response
    @errors = response ? "Something went wrong"
    @loadingCount -= 1

module.exports = alt.createStore SquadStore, "SquadStore"