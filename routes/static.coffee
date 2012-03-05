app.get "/", (req, res) ->
  res.render "home", 
    name: "chris"
    stuff: [{item: "banana"}, {item: "blake griffin"}, {item: "world peace"}]



