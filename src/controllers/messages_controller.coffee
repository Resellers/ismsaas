Messages = require '../collections/messages'

class MessagesController
  @index: (request, response) ->
    messages = new Messages
    messages.fetch =>
      response.send messages.toJSON()

module.exports = MessagesController
