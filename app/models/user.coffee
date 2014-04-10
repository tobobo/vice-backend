mongoose = require 'mongoose'
passportLocalMongoose = require 'passport-local-mongoose'

userSchema = new mongoose.Schema
  email:
    type: String
    unique: true
    required: true
    trim: true
    lowercase: true

userSchema.plugin passportLocalMongoose,
  usernameField: 'email'

userSchema.methods.serializeToObj = ->
  user:
    id: @id
    email: @email

userSchema.methods.serialize = (meta) ->
  JSON.stringify
    user: @serializeToObj()
    meta: meta

User.serialize = (users, meta) ->
  users: users.map (users) -> user.serializeToObj()
  meta: meta

User.deserialize = (params) ->
  userSchema.methods.serializeToObj.call params

User.params = (params) ->
  params = User.deserialize params
  for k, v of params
    unless v? then delete params[k]
  params

User = mongoose.model 'User', userSchema

module.exports = User
