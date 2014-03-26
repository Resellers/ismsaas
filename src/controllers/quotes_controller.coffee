Quote  = require '../models/quote'
Quotes = require '../collections/quotes'

class QuotesController
  @index: (request, response) ->
    quotes = new Quotes
    quotes.fetch success: =>
      response.send quotes.toJSON()

  @create: (request, response) ->
    quote = new Quote request.body
    quote.save {}, success: ->
      response.send quote.toJSON(), 201

module.exports = QuotesController
