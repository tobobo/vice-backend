module.exports = (schema, options) ->
  schema.methods.serializeToObj = (meta) ->
    result = {}
    for k, v of @schema.paths
      if k.substr(0,2) != '__'
        key = if k == '_id' then 'id' else k
        result[key] = @[key]
    result

  schema.methods.serialize = (meta) ->
    result =
      meta: meta
    result["#{options.singular}"] = @serializeToObj()
    result

  schema.statics.serialize = (models, meta) ->
    result = 
      meta: meta
    result["#{options.plural}"] = models.map (model) -> model.serializeToObj()
    result

  schema.methods.deserialize = (params) ->
    schema.methods.serializeToObj.call params

  schema.methods.params = (params) ->
    result = schema.methods.deserialize params
    for k, v of result
      unless v?
        delete result[k]
    result
