_      = require 'underscore'
Ism    = require '../models/ism'
Quote  = require '../models/quote'

class QuotesController
  @create: (request, response) ->
    ism = new Ism _id: request.params.ism_id
    ism.fetch success: =>
      quote = new Quote _.pick(request.body, 'text')
      ism.quotes.add quote
      ism.save {}, success: =>
        response.send quote.toJSON(), 201

  @destroy: (request, response) ->
    ism = new Ism _id: request.params.ism_id
    ism.fetch success: =>
      quote = ism.quotes.findWhere _id: request.params.quote_id
      quote.destroy success: =>
        response.send null, 204

module.exports = QuotesController
