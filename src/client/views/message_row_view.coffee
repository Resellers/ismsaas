define ['backbone', 'templates/quote_row'], (Backbone) ->
  class MessageRowView extends Backbone.View
    template: JST['quote_row']
    className: 'list-group-item'

    context: =>
      model: @model.toJSON()

    render: =>
      @$el.html @template @context()

