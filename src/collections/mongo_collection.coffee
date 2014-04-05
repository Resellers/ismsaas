Backbone   = require 'backbone'
mongo_sync = require '../extensions/mongo_sync'

class MongoCollection extends Backbone.Collection
  sync: mongo_sync

module.exports = MongoCollection
