CollectionSource = (url, actions) ->
  return {
    fetchList:
      remote: (state) => Squadd.api.get(url())
      success: actions.fetchSuccess
      error:   actions.fetchError
  }

module.exports = CollectionSource