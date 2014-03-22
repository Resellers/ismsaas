Backbone = require 'backbone'
{MongoClient} = require 'mongodb'

class Message extends Backbone.Model
  save: (attributes={}) =>
    @set attributes
    MongoClient.connect 'mongodb://127.0.0.1:27017/ismsaas', (err, db) =>
      db.collection('messages').insert @toJSON(), =>
        @trigger 'sync'
        db.close()

module.exports = Message
