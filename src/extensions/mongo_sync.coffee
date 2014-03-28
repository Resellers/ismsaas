{MongoClient,ObjectID} = require 'mongodb'
_                      = require 'underscore'


METHODS =
  'create': 'insert'
  'read':   'find'
#   'update': 'save'
#   'patch':  'save'
#   'delete': 'remove'

module.exports = (method, model, options={}) ->
  url = _.result model, 'url'

  unless url?
    throw new Error 'A "url" property or function must be specified'

  single_record = /\//.test url
  [url,id] = url.split('/')

  type = METHODS[method]
  data = options.attrs ? model.toJSON()

  MongoClient.connect global.database, (err, db) =>
    collection = db.collection(url)

    if single_record
      type = 'findOne'
      data = _id: new ObjectID id

    if type == 'find'
      func = (cb=->) -> collection[type]().toArray cb
    else
      func = (cb=->) -> collection[type](data, cb)

    func (error, results) =>
      return options.error error if error?
      options.success results
