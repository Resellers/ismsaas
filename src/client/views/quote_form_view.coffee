define ['backbone', 'templates/quote_form'], (Backbone) ->
  class QuoteFormView extends Backbone.View
    template: JST['quote_form']

    initialize: =>
      @listenTo @model, 'sync', => Backbone.history.navigate Path.ism(@model.get 'ism_id'), true

    context: =>
      cid: @cid

    render: =>
      @$el.html @template @context()

    events:
      'submit':       'submit'
      'change input': 'update_model'

    submit: ($event) =>
      $event.preventDefault()
      @model.save()

    update_model: =>
      @model.set
        text: @$('input.text').val()
