define [
  'backbone'
  'views/quote_row_view'
  'templates/quotes_list'
  ], (Backbone, QuoteRowView) ->
  class QuotesListView extends Backbone.View
    template: JST['quotes_list']

    initialize: =>
      @views = []
      @listenTo @collection, 'add', @add_one
      @listenTo @collection, 'sync error request reset destroy', @render

    render: =>
      @$el.html @template ism_id: @collection.ism_id
      @remove_views()
      @collection.each @add_one
      @$el

    remove: =>
      super
      @remove_views()

    # Instance Methods
    add_one: (model) =>
      view = new QuoteRowView model: model
      @$('.list-group').append view.render()
      @views.push view

    remove_views: =>
      _.each @views, (view) =>
        view.remove()
      @views = []
