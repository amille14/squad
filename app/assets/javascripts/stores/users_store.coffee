alt = require("../alt")
CollectionStore = require("./collection_store")
UserActions = require("../actions/user_actions")
UserSource = require("../sources/user_source")

class UsersStore extends CollectionStore
  constructor: ->
    super(UserSource, UserActions, true)


module.exports = alt.createStore UsersStore, "UsersStore"