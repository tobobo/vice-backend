module.exports = (app) ->
  index = require('./controllers/index') app
  stories = require('./controllers/stories') app

  app.get '/', index

  app.get '/stories', stories.index
  app.post '/stories', stories.new
  app.put '/stories/:storyId', stories.update
  app.delete '/stories/:storyId', stories.delete
