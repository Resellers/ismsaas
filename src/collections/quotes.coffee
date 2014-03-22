{MongoClient} = require 'mongodb'
Backbone = require 'backbone'

class Quotes extends Backbone.Collection
  fetch: (cb=->) =>
    MongoClient.connect 'mongodb://127.0.0.1:27017/ismsaas', (err, db) =>
      db.collection('quotes').find().toArray (err, results) =>
        @set results
        db.close()
        cb()

module.exports = Quotes

