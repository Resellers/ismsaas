define ['backbone', 'templates/random_quote'], (Backbone) ->
  class RandomQuoteView extends Backbone.View
    template: JST['random_quote']

    initialize: =>
      @listenTo @collection, 'change', @render

    context: =>
      model: @model?.toJSON()

    render: =>
      @model = @collection.sample()
      @$el.html @template @context()
