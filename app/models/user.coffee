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

userSchema.methods.serialize = (meta) ->
  JSON.stringify
    user:
      id: @id
      email: @email
    meta:
      meta

module.exports = mongoose.model 'User', userSchema
