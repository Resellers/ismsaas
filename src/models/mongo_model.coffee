Backbone   = require 'backbone'
mongo_sync = require '../extensions/mongo_sync'

class MongoModel extends Backbone.Model
  sync: mongo_sync
  idAttribute: '_id'

module.exports = MongoModel
