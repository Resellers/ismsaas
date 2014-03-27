define ['backbone', 'templates/ism'], (Backbone) ->
  class IsmView extends Backbone.View
    template: JST['ism']

    context: =>
      model: @model.toJSON()

    render: =>
      @$el.attr 'href', Path.ism @model.id
      @$el.html @template @context()

