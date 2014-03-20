class MessagesController
  @index: (request, response) ->
    response.send 'hello world'

module.exports = MessagesController
