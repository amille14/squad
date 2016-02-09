ItemSource = (url, actions) ->
  return {
    fetchItem:
      remote: (state, id) => Squadd.api.get(url(id))
      success: actions.fetchSuccess
      error:   actions.fetchError
  }

module.exports = ItemSource