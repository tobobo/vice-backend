module.exports = (app) ->
  index = require('./controllers/index') app
  
  app.get '/', index
