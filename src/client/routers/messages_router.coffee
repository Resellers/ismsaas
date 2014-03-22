define [
  'models/message'
  'collections/messages'
  'views/messages_list_view'
  'views/message_form_view'
  ], (Message, Messages, MessagesListView, MessageFormView) ->

  class MessagesRouter extends Backbone.Router
    routes:
      ''             : 'index'
      'messages/new' : 'new'

    index: =>
      collection = new Messages
      collection.fetch()
      view = new MessagesListView collection: collection
      $('#main-content').html view.render()

    new: =>
      model = new Message
      view  = new MessageFormView model: model
      $('#main-content').html view.render()

  new MessagesRouter
