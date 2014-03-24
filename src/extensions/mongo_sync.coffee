{MongoClient} = require 'mongodb'
_             = require 'underscore'


METHODS =
  'create': 'insert'
  'read':   'find'
#   'update': 'save'
#   'patch':  'save'
#   'delete': 'remove'

module.exports = (method, model, options={}) ->
  unless _.result(model, 'url')?
    throw new Error 'A "url" property or function must be specified'

  type = METHODS[method]

  MongoClient.connect global.database, (err, db) =>
    if type == 'find'
      func = db.collection('quotes')[type]().toArray
    else
      func = (cb=->) -> db.collection('quotes')[type](model.toJSON(), cb)
    func (err, results) => options.success results
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
