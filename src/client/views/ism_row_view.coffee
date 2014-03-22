define ['backbone', 'templates/ism_row'], (Backbone) ->
  class IsmRowView extends Backbone.View
    template: JST['ism_row']
    className: 'list-group-item'

    context: =>
      model: @model.toJSON()

    render: =>
      @$el.html @template @context()

