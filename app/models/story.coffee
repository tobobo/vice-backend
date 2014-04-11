mongoose = require 'mongoose'
passportLocalMongoose = require 'passport-local-mongoose'
modelMethods = require '../utils/model_methods'

storySchema = new mongoose.Schema
  name:
    type: String
    required: true
  region:
    type: Number
  type:
    type: Number
  status:
    type: Number

storySchema.plugin modelMethods,
  singular: 'story'
  plural: 'stories'

Story = mongoose.model 'Story', storySchema

enumerators =
  TYPES: ['LIGHT', 'MEDIUM', 'HEAVY']
  REGIONS: ['US', 'MIDEAST', 'AFRICA', 'S_AMERICA', 'CHINA', 'EUROPE', 'ASIA_AUS']
  STATUS: ['PENDING', 'GREENLIT', 'REJECTED']

for enumName, enumValues of enumerators
  Story[enumName] = {}
  for enumIndex, enumValue of enumValues
    Story[enumName][enumValue] = enumIndex
    Story[enumName][enumIndex] = enumValue

module.exports = Story
