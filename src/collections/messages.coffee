{MongoClient} = require 'mongodb'
Backbone = require 'backbone'

class Messages extends Backbone.Collection
  fetch: (cb=->) =>
    MongoClient.connect 'mongodb://127.0.0.1:27017/ismsaas', (err, db) =>
      db.collection('messages').find().toArray (err, results) =>
        @set results
        db.close()
        cb()

module.exports = Messages

