class CollectionStore
  constructor: (source, actions) ->
    # Public state
    @list = []
    @by = {}
    @errors = null
    @loadingCount = 0

    # Private state
    @_indexes = ["id"]  # Override this to add additional indexes

    @bindListeners
      onFetchList:        actions.FETCH_LIST
      onFetchListSuccess: actions.FETCH_LIST_SUCCESS
      onFetchListError:   actions.FETCH_LIST_ERROR

    @registerAsync(source)

    @on "bootstrap", => @indexList()


  # Util Methods
  #==================

  indexList: (items = @list) ->
    for item in items
      for index in @_indexes
        @by[index] ||= {}
        if index is "id"
          @by[index][item[index]] = item if item[index]?
        else
          @by[index][item[index]] ||= {}
          @by[index][item[index]][item.id] = item

  isLoading: ->
    @loadingCount > 0


  # Action Handlers
  #===================

  onFetchList: (options = {}) ->
    console.log "FETCH", options
    @loadingCount += 1
    if options.reset
      @list = []
      @by = {}
    @getInstance().fetchList(options)

  onFetchListSuccess: (response) ->
    console.log "SUCCESS", response
    @indexList(response.data)
    @list = _.values(@by.id)
    @errors = null
    @loadingCount -= 1

  onFetchListError: (response) ->
    console.log "ERROR", response
    @errors = response ? "Something went wrong"
    @loadingCount -= 1


module.exports = CollectionStore