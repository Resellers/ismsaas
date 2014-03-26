Backbone   = require 'backbone'
_          = require 'underscore'
mongo_sync = require '../extensions/mongo_sync'
Quotes     = require '../collections/quotes'

class Ism extends Backbone.Model
  sync: mongo_sync
  url:  'isms'

  initialize: =>
    @quotes = new Quotes

  toJSON: =>
    _.defaults super,
      quotes: @quotes.toJSON()

module.exports = Ism
