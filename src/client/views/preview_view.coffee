define ['backbone', 'views/random_quote_view','templates/preview'], (Backbone,RandomQuoteView) ->
  class PreviewView extends Backbone.View
    template: JST['preview']
    className: 'ism'

    initialize: =>
      @listenTo @model, 'change', @render

    render: =>
      @random_quote_view = new RandomQuoteView collection: @model.quotes
      @$el.html @template()
      $('body').css 'background-image': "url('#{@model.get 'image_url'}')"
      @$el.append @random_quote_view.render()
