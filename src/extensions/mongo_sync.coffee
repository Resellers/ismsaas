{MongoClient} = require 'mongodb'
_             = require 'underscore'


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
  url = _.first url.split('/')

  type = METHODS[method]
  data = options.attrs ? model.toJSON()

  MongoClient.connect global.database, (err, db) =>
    if single_record
      func = (cb=->) -> db.collection(url).findOne data, cb
    else if type == 'find'
      func = (cb=->) -> db.collection(url)[type]().toArray cb
    else
      func = (cb=->) -> db.collection(url)[type](data, cb)

    func (error, results) =>
      return options.error error if error?
      options.success results
