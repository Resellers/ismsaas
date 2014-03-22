define ['backbone', 'templates/message_row'], (Backbone) ->
  class MessageRowView extends Backbone.View
    template: JST['message_row']
    className: 'list-group-item'

    context: =>
      model: @model.toJSON()

    render: =>
      @$el.html @template @context()

