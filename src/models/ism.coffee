Backbone = require 'backbone'
{MongoClient} = require 'mongodb'

class Ism extends Backbone.Model
  save: (attributes={}, success:cb) =>
    @set attributes
    MongoClient.connect 'mongodb://127.0.0.1:27017/ismsaas', (err, db) =>
      db.collection('isms').insert @toJSON(), =>
        @trigger 'sync'
        db.close()
        cb()

module.exports = Ism
