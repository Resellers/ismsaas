define [
  'models/quote'
  'collections/quotes'
  'views/quotes_list_view'
  'views/quote_form_view'
  ], (Quote, Quotes, QuotesListView, QuoteFormView) ->

  class QuotesRouter extends Backbone.Router
    initialize: =>
      @on 'route', =>
        $('.navbar-nav li').removeClass 'active'
        $('.navbar-nav li.nav-quotes').addClass 'active'

    routes:
      'quotes'     : 'index'
      'quotes/new' : 'new'

    index: =>
      collection = new Quotes
      collection.fetch()
      view = new QuotesListView collection: collection
      $('#main-content').html view.render()

    new: =>
      model = new Quote
      view  = new QuoteFormView model: model
      $('#main-content').html view.render()

  new QuotesRouter
