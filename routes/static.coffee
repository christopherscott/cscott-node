require "coffee-script"
Post = require "./models/Post"


app.get "/", (req, res) ->
  latest_posts = Post.find({})
    .limit(5)
    .run((err, docs) ->
      res.render "home",
        latest: docs
    )
