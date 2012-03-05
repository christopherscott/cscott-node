require "coffee-script"
express = require "express"
app = express.createServer()
hulk = require "hulk-hogan"
router = require "./router"

app.configure(() ->

  # view (template) configuration
  app.set "views", "#{__dirname}/views"
  app.set "view engine", "html"
  app.set "view options", layout: false
  app.register ".html", hulk

  app.use(express.static("#{__dirname}/public"))
  app.use(app.router)

)

# mount routes for the app
router.mount app

app.listen(3000)
console.log "application started on port 3000"