Backbone   = require 'backbone'
_          = require 'underscore'
Quotes     = require '../collections/quotes'
MongoModel = require './mongo_model'

class Ism extends MongoModel
  urlRoot:  'isms'

  initialize: =>
    @quotes = new Quotes @get 'quotes'
    @on 'change:quotes', =>
      @quotes.set @get 'quotes'
    @listenTo @quotes, 'add', (model) => model.set ism_id: @id

  toJSON: =>
    _.extend super,
      quotes: @quotes.toJSON()

module.exports = Ism
