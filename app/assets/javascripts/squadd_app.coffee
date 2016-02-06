alt = require("./alt")
# SquadsStore   = require("./stores/squads_store")
# UsersStore    = require("./stores/users_store")
# RoomsStore    = require("./stores/rooms_store")
# PostsStore    = require("./stores/posts_store")
MessagesStore = require("./stores/messages_store")
MessagesActions = require("./actions/message_actions")

window.Squadd = window.Squadd ? {}

class SquaddApp
  bootstrap: (data) ->
    console.log "BOOTSTRAP", data

    # TODO: Actually bootstrap this
    @currentSquad = data.squad
    @currentRoom = data.rooms[0]

    # @stores =
    #   squads: SquadsStore.bootstrap([data.squad])
    #   users:  UsersStore.bootstrap([data.current_user])
    #   rooms:  RoomsStore.bootstrap(data.rooms)

    MessagesActions.fetch(1)

  # TODO: Change this to use stores
  getCurrentSquad: ->
    return @currentSquad

  # TODO: Change this to use stores
  getCurrentRoom: ->
    return @currentRoom



# Create/export the Squadd App
window.Squadd.App = new SquaddApp()
module.exports = Squadd