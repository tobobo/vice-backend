mongoose = require 'mongoose'
passportLocalMongoose = require 'passport-local-mongoose'
modelMethods = require '../utils/model_methods'

mongoose.Schema.prototype.serialize = (meta) ->
  JSON.stringify
    user: @serializeToObj()
    meta: meta

userSchema = new mongoose.Schema
  email:
    type: String
    unique: true
    required: true
    trim: true
    lowercase: true

userSchema.plugin passportLocalMongoose,
  usernameField: 'email'

userSchema.plugin modelMethods,
  singular: 'user'
  plural: 'users'

User = mongoose.model 'User', userSchema

module.exports = User
