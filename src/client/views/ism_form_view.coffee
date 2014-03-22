define ['backbone', 'templates/ism_form'], (Backbone) ->
  class IsmFormView extends Backbone.View
    template: JST['ism_form']

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
        name: @$('input.name').val()
