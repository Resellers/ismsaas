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

  toJSON: =>
    _.defaults super,
      quotes: @quotes.toJSON()

  parse: (results, err) =>
    console.log result
    super

module.exports = Ism
