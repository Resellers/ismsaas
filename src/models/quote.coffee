Backbone = require 'backbone'
{MongoClient} = require 'mongodb'

class Quote extends Backbone.Model
  save: (attributes={}, success:cb) =>
    @set attributes
    MongoClient.connect 'mongodb://127.0.0.1:27017/ismsaas', (err, db) =>
      db.collection('quotes').insert @toJSON(), =>
        @trigger 'sync'
        db.close()
        cb()

module.exports = Quote
