alt = require("../alt")
CollectionStore = require("./collection_store")
RoomActions = require("../actions/room_actions")
RoomSource = require("../sources/room_source")

class RoomsStore extends CollectionStore
  constructor: ->
    super(RoomSource, RoomActions, true)


module.exports = alt.createStore RoomsStore, "RoomsStore"