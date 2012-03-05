require "coffee-script"
express = require "express"
app = express.createServer()
hulk = require "hulk-hogan"
router = require "./router"
{dbhost, dbport, dbname} = require("./config").database

# initialize database connection
mongoose = require "mongoose"
mongoose.connect "mongodb://#{dbhost}:#{dbport}/#{dbname}"

app.configure(() ->

  # view (template) configuration
  app.set "views", "#{__dirname}/views"
  app.set "view engine", "html"
  app.set "view options", layout: false
  app.register ".html", hulk

  app.use(express.static("#{__dirname}/public"))
  app.use(app.router)

  app.use(express.errorHandler(
    showStack: true
    dumpExceptions: true
  ))

)

# mount routes for the app
router.mount app

app.listen(3000)
console.log "application started on port 3000"