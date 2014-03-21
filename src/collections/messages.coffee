{MongoClient} = require 'mongodb'

class Messages
  add: =>

  fetch: (cb=->) =>
    MongoClient.connect 'mongodb://127.0.0.1:27017/ismsaas', (err, db) =>
      db.collection('messages').find().toArray (err, results) =>
        @add results
        db.close()
        cb()

  toJSON: =>
    []

module.exports = Messages

