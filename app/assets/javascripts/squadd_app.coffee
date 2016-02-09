alt = require("./alt")    # Flux implementation
axios = require("axios")  # For making HTTP requests

SquadStore = require("./stores/squad_store")
UsersStore = require("./stores/users_store")
RoomsStore = require("./stores/rooms_store")
PostsStore = require("./stores/posts_store")
MessagesStore = require("./stores/messages_store")

MessageActions = require("./actions/message_actions")
UserActions = require("./actions/user_actions")
RoomActions = require("./actions/room_actions")
PostActions = require("./actions/post_actions")
SquadActions = require("./actions/squad_actions")


class SquaddApp
  constructor: ->
    # TODO: Change baseUrl based on ENV
    @api = axios.create(baseURL: "http://localhost:3000/api/")

  bootstrap: (data) ->
    console.log "BOOTSTRAP", data

    alt.bootstrap JSON.stringify(
      SquadStore: _.extend({}, SquadStore.getState(), {id: data.squad.id, name: data.squad.name})
      UsersStore: _.extend({}, UsersStore.getState(), {currentId: data.current_user.id, list: [data.current_user]})
      RoomsStore: _.extend({}, RoomsStore.getState(), {currentId: data.rooms[0]?.id, list: data.rooms})
    )

    # MessageActions.fetchList()
    # PostActions.fetchList()
    # UserActions.fetchList()
    # UserActions.fetchItem(2)
    # RoomActions.fetchList()
    # RoomActions.fetchItem(2)

  getSquad: -> SquadStore.getState()

  getCurrent: (storeType) ->
    store = switch storeType
      when "user" then UsersStore
      when "room" then RoomsStore
      when "post" then PostsStore
    state = store.getState()
    return state.list[state.currentId]

  getCurrentId: (storeType) ->
    store = switch storeType
      when "user" then UsersStore
      when "room" then RoomsStore
      when "post" then PostsStore
    return store.getState().currentId

# Create/export the Squadd App
window.Squadd = new SquaddApp()
module.exports = window.Squadd