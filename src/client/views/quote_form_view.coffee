define ['backbone', 'templates/quote_form'], (Backbone) ->
  class MessageFormView extends Backbone.View
    template: JST['quote_form']

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
