define ['backbone', 'templates/quote_row'], (Backbone) ->
  class QuoteRowView extends Backbone.View
    template: JST['quote_row']
    className: 'list-group-item'

    context: =>
      model: @model.toJSON()

    render: =>
      @$el.html @template @context()

    events:
      'click .delete-quote': 'delete'

    delete: ($event) =>
      $event.preventDefault()
      $event.stopPropagation()
      @model.destroy()

