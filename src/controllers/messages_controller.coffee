Message  = require '../models/message'
Messages = require '../collections/messages'

class MessagesController
  @index: (request, response) ->
    messages = new Messages
    messages.fetch =>
      response.send messages.toJSON()

  @create: (request, response) ->
    message = new Message request.body
    message.save {}, success: ->
      response.send message.toJSON(), 201

module.exports = MessagesController
