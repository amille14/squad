class CollectionStore
  constructor: (source, actions, hasItemActions = false) ->
    # Public state
    @list = []
    @by = {}
    @errors = null
    @loadingCount = 0

    # Private state
    @_indexes = ["id"]  # Override this to add additional indexes

    @bindListeners
      onFetchList:    actions.FETCH_LIST
      onFetchSuccess: actions.FETCH_SUCCESS
      onFetchError:   actions.FETCH_ERROR

    @bindListeners(onFetchItem: actions.FETCH_ITEM) if hasItemActions

    @registerAsync(source)

    @on "bootstrap", => @indexList()


  # Util Methods
  #==================

  indexList: (items = @list) ->
    if items?
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
    console.log "FETCH LIST", options
    @loadingCount += 1
    if options.reset
      @list = []
      @by = {}
    @getInstance().fetchList(options)

  onFetchItem: (id) ->
    console.log "FETCH ITEM", id
    @loadingCount += 1
    @getInstance().fetchItem(id)

  onFetchSuccess: (response) ->
    console.log "SUCCESS", response
    data = if _.isArray(response.data) then response.data else [response.data]
    @indexList(data)
    @list = _.values(@by.id)
    @errors = null
    @loadingCount -= 1

  onFetchError: (response) ->
    console.log "ERROR", response
    @errors = response ? "Something went wrong"
    @loadingCount -= 1


module.exports = CollectionStore