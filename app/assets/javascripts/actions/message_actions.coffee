alt = require("../alt")

# TODO: Change this to use alt sources http://alt.js.org/docs/async/

urlRoot = ->
  squad = Squadd.App.getCurrentSquad()
  room  = Squadd.App.getCurrentRoom()
  return "/api/squads/#{squad.id}/rooms/#{room.id}"

class MessageActions
  fetch: (postId) ->
    url = urlRoot()
    url += "/posts/#{postId}" if postId?
    url += "/messages"

    return (dispatch) =>
      dispatch()

      $.getJSON
        url: url
        success: (response) => @update(response)
        error: (response) => @error(response)

  update: (messages) -> return messages
  error: (response) ->
    console.log 'BLAH', response
    return response

module.exports = alt.createActions(MessageActions)