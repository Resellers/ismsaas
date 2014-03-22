define [
  'models/quote'
  'collections/quotes'
  'views/messages_list_view'
  'views/message_form_view'
  ], (Quote, Quotes, MessagesListView, MessageFormView) ->

  class MessagesRouter extends Backbone.Router
    routes:
      ''             : 'index'
      'messages/new' : 'new'

    index: =>
      collection = new Quotes
      collection.fetch()
      view = new MessagesListView collection: collection
      $('#main-content').html view.render()

    new: =>
      model = new Quote
      view  = new MessageFormView model: model
      $('#main-content').html view.render()

  new MessagesRouter
