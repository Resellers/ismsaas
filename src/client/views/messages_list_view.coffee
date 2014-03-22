define [
  'backbone'
  'views/quote_row_view'
  'templates/quotes_list'
  ], (Backbone, QuoteRowView) ->
  class MessagesListView extends Backbone.View
    template: JST['quotes_list']

    initialize: =>
      @views = []
      @listenTo @collection, 'add', @add_one
      @listenTo @collection, 'sync error request reset', @render

    render: =>
      @$el.html @template()
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
