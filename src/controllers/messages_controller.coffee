Quote  = require '../models/quote'
Quotes = require '../collections/quotes'

class MessagesController
  @index: (request, response) ->
    messages = new Quotes
    messages.fetch =>
      response.send messages.toJSON()

  @create: (request, response) ->
    message = new Quote request.body
    message.save {}, success: ->
      response.send message.toJSON(), 201

module.exports = MessagesController
