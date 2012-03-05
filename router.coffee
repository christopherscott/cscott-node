fs = require "fs"
vm = require "vm"
util = require "util"
coffee = require "coffee-script"

# route loader, taken mostly from the examples in the Express source:
# https://github.com/visionmedia/express/blob/master/examples/route-loading/boot.js
# - added compilation step for coffee-script modules
# - renamed some variables to be more semantic
module.exports.mount = (app) ->
  routedir = __dirname + "/routes"
  # loop through list of route files
  fs.readdirSync(routedir).forEach((routefile) ->

    # get file contents, compile from coffeescript into js
    coffee_source = fs.readFileSync("#{routedir}/#{routefile}", "utf8")
    js_source = coffee.compile coffee_source

    # load up our context object with our shared globals
    # not sure why but "require" isn't caught by the loop
    # so we add it manually... TODO: fix this
    context = app: app, require: require
    for key, value of global
      context[key] = global[key]

    # compiles (from js to machine code), then runs the code in
    # the given 'context'; code does not have access to this local scope
    # so it's safer than using eval
    vm.runInNewContext js_source, context, routefile

  )
