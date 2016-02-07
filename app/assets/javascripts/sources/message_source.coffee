MessageActions = require('../actions/message_actions')

MessageSource =

  fetchList:
    remote: (state) ->
      squadId = Squadd.getSquad()?.id
      userId  = Squadd.getCurrentId("user")
      roomId  = Squadd.getCurrentId("room")
      postId  = Squadd.getCurrentId("post")

      if squadId?
        url = "/squads/#{squadId}/rooms/#{roomId}"
      else
        url = "/users/#{userId}/room"
      url += "/posts/#{postId}" if postId?
      url += "/messages"

      console.log "GET #{url}"

      Squadd.api.get(url)

    # local: (state) -> # TODO

    loading: MessageActions.loading
    success: MessageActions.fetchListSuccess
    error:   MessageActions.fetchListError

module.exports = MessageSource