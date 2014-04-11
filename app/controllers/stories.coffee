Story = require '../models/story'

module.exports = (app) ->
  index: (req, res) ->
    Story.find Story.params(req.query)
    .exec().then (stories) ->
      res.send Story.serialize(stories)

  new: (req, res) ->
    new Story Story.params(req.body.story)
    .saveP().then (story) ->
      console.log 'in here'
      res.send story.serialize()
    , (error) ->
      res.statusCode = 422
      res.send JSON.stringify
        meta: error

  update: (req, res) ->
    Story.findByIdAndUpdate req.param('storyId'), Story.params(req.body.story)
    .exec().then (story) ->
      res.send story.serialize()

  delete: (req, res) ->
    Story.findByIdAndRemove req.param('storyId')
    .exec().then ->
      res.send JSON.stringify
        meta:
          success: true
