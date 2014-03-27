@Posts = new Meteor.Collection 'posts'

@Posts.allow 
  insert: (userId, post) ->
    return userId && post.owner == userId

  update: (userId, posts, fields, modifier) ->
    return _.all posts, (post) ->
      if userId != post.owner
        return false

      allowed = ['title', 'content']
      if _.difference(fields, allowed).length
        return false

      return true

  remove: (userId, post) ->
    if userId == post.owner
      return true
    return false
