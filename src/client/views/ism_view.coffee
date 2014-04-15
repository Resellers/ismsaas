define ['backbone', 'views/quotes_list_view', 'templates/ism'], (Backbone, QuotesListView) ->
  class IsmView extends Backbone.View
    template: JST['ism']

    initialize: =>
      @listenTo @model, 'change', @render

    context: =>
      model: @model.toJSON()

    render: =>
      @quotes_list_view = new QuotesListView collection: @model.quotes
      @$el.html @template @context()
      @$el.append @quotes_list_view.render()

