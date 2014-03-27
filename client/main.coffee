Template.posts.posts = -> return Posts.find({}, { sort: {'title': 1} })

Template.blog.events 
  'submit #blogPost': (e)->
    e.preventDefault()
    Posts.insert
      title: $('#title').val()
      content: $('#content').val()
      user: Meteor.user()
      owner: Meteor.userId()
      created_at: new Date()
      
    $('#myModal').foundation('reveal', 'close');
    document.forms["blogPost"].reset();


Template.post_one.events
  'click #delete': ->
    Posts.remove(this._id)
