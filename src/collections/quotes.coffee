Backbone   = require 'backbone'
mongo_sync = require '../extensions/mongo_sync'

class Quotes extends Backbone.Collection
  sync: mongo_sync
  url: 'quotes'

module.exports = Quotes

