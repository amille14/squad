alt = require("../alt")
CollectionStore = require("./collection_store")
PostActions = require("../actions/post_actions")
PostSource = require("../sources/post_source")

class PostsStore extends CollectionStore
  constructor: ->
    super(PostSource, PostActions, true)
    @_indexes.push "room_id"


module.exports = alt.createStore PostsStore, "PostsStore"