define ['routers/messages_router'], ->
  class MessagesRouter extends Backbone.Router
    routes:
      '' : 'index'

    index: =>

  new MessagesRouter
