define [
  'models/quote'
  'collections/quotes'
  'views/quotes_list_view'
  'views/quote_form_view'
  ], (Quote, Quotes, QuotesListView, QuoteFormView) ->

  class MessagesRouter extends Backbone.Router
    routes:
      ''             : 'index'
      'messages/new' : 'new'

    index: =>
      collection = new Quotes
      collection.fetch()
      view = new QuotesListView collection: collection
      $('#main-content').html view.render()

    new: =>
      model = new Quote
      view  = new QuoteFormView model: model
      $('#main-content').html view.render()

  new MessagesRouter
