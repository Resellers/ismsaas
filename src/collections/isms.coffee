Backbone   = require 'backbone'
mongo_sync = require '../extensions/mongo_sync'

class Isms extends Backbone.Collection
  sync: mongo_sync
  url:  'isms'

module.exports = Isms

