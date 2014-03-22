define ['backbone', 'models/message'], (Backbone, Message) ->
  class Messages extends Backbone.Collection
    model: Message
    url: '/api/v1/messages'
