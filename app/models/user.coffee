mongoose = require 'mongoose'
passportLocalMongoose = require 'passport-local-mongoose'
modelMethods = require '../utils/model_methods'

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

userSchema.methods.serializeToObj = ->
  id: @id
  email: @email

User = mongoose.model 'User', userSchema

module.exports = User
