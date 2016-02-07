alt = require("../alt")


class MessageActions
  constructor: ->
    @generateActions "fetchList", "loading", "fetchListSuccess", "fetchListError"

  # fetch: (postId) ->
  #   url = urlRoot()
  #   url += "/posts/#{postId}" if postId?
  #   url += "/messages"

  #   return (dispatch) =>
  #     dispatch()

  #     $.getJSON
  #       url: url
  #       success: (response) => @update(response)
  #       error: (response) => @error(response)

  # update: (messages) -> return messages
  # error: (response) ->
  #   console.log 'BLAH', response
  #   return response
  # fetch: (postId) -> return postId
  # loading: -> return
  # fetchListSuccess: (response) -> return response
  # fetchListError:   (response) -> return response

module.exports = alt.createActions(MessageActions)