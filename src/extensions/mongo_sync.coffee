{MongoClient} = require 'mongodb'
_             = require 'underscore'

module.exports = (method, model, options={}) ->
  unless _.result(model, 'url')?
    throw new Error 'A "url" property or function must be specified'

  MongoClient.connect global.database, (err, db) =>
    db.collection('quotes').insert {}, options.success
# urlError = -> throw new Error 'A "url" property or function must be specified'

# METHODS =
#   'create': 'insert'
#   'update': 'save'
#   'patch':  'save'
#   'delete': 'remove'
#   'read':   'find'

  # type = METHODS[method]

  # url  = options.url ? _.result(model, 'url')
  # urlError() unless url?

  # data = options.attrs ? model.toJSON()

  # MongoClient.connect global.database, (err, db) =>
  #   if type == 'read'
  #     console.log 'type is read'
  #     func = db.collection(url)[type].toArray
  #   else
  #     func = (cb=->) -> db.collection(url)[type] model.toJSON(), cb

  #   func (err, results) =>
  #     db.close()
  #     return options.success(results) unless err?
  #     options.error(results)
