express = require 'express'
middleware = require './middleware'
routes = require './routes'

module.exports = (config) ->

  app = express()

  db = require('./db') config

  middleware config, app, db

  routes app

  app
