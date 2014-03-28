express = require 'express'
passport = require 'passport'
MongoStore = require('connect-mongo') express

module.exports = (config, app, db) ->
  app.use express.static('public')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser(config.session.cookie_secret)

  connection = db.connections[0]
  app.use express.session
    secret: config.session.secret
    store: new MongoStore
      collection: 'sessions'
      url: config.db.url
    , (db) ->
      console.log 'mongo store connected'
    cookie:
      maxAge: 60*60*1000
      domain: config.session.cookie_domain

  app.use passport.initialize()
  app.use passport.session()
