define ['collections/messages', 'views/messages_list_view'], (Messages, MessagesListView) ->
  class MessagesRouter extends Backbone.Router
    routes:
      '' : 'index'

    index: =>
      collection = new Messages
      collection.fetch()
      view = new MessagesListView collection: collection
      $('#main-content').html view.render()

  new MessagesRouter
