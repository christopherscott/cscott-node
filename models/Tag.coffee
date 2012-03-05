mongoose = require("mongoose")
Schema = mongoose.Schema

TagSchema = new Schema(name:
  type: String
  unique: true
)

module.exports = mongoose.model("Tag", TagSchema)