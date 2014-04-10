module.exports = (schema, options) ->
  schema.methods.serializeToObj = (meta) ->
    result = {}
    for k, v of schema.paths
      if k.substr(0,2) != '__'
        key = if k == '_id' then 'id' else k
        result[key] = @[key]
    result

  schema.methods.serialize = (meta) ->
    result =
      meta: meta
    result["#{options.singular}"] = @serializeToObj()
    JSON.stringify result

  schema.statics.serialize = (models, meta) ->
    result = 
      meta: meta
    result["#{options.plural}"] = models.map (model) -> model.serializeToObj()
    JSON.stringify result

  schema.statics.deserialize = (params) ->
    schema.methods.serializeToObj.call params

  schema.statics.params = (params) ->
    result = schema.statics.deserialize params
    for k, v of result
      unless v?
        delete result[k]
    result
