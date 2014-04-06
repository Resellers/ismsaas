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
      'isms/:ism_id/quotes/new' : 'new'

    new: (ism_id) =>
      model = new Quote ism_id: ism_id
      view  = new QuoteFormView model: model
      $('#main-content').html view.render()

  new QuotesRouter
