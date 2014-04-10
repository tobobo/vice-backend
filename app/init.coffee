express = require 'express'
middleware = require './middleware'
routes = require './routes'
db = require './db'

module.exports = (config) ->

  app = express()

  app.config = config

  app.db = db app

  middleware app

  routes app

  app
