define ['backbone', 'templates/ism_row'], (Backbone) ->
  class IsmRowView extends Backbone.View
    template: JST['ism_row']
    tagName:   'a'
    className: 'list-group-item'

    context: =>
      model: @model.toJSON()

    render: =>
      @$el.attr 'href', Path.ism @model.id
      @$el.html @template @context()

