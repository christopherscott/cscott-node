mongoose = require("mongoose")
Schema = mongoose.Schema
Tag = require("./Tag")

PostSchema = new Schema(
  title:
    type: String
    unique: true

  body: String
  status:
    type: String
    enum: [ "draft", "hidden", "pending", "live" ]

  tags: [
    type: Schema.ObjectId
    ref: "Tag"
   ]
  created_at: Date
  last_modified: Date
)

module.exports = mongoose.model("Post", PostSchema)