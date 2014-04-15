define ['backbone', 'templates/ism_form'], (Backbone) ->
  class IsmFormView extends Backbone.View
    template: JST['ism_form']

    initialize: =>
      @listenTo @model, 'change', @render

    context: =>
      cid: @cid
      model: @model.toJSON()

    render: =>
      @$el.html @template @context()

    events:
      'submit':       'submit'
      'change input': 'update_model'

    submit: ($event) =>
      $event.preventDefault()
      @listenToOnce @model, 'sync', => Backbone.history.navigate Path.isms(), true
      @model.save()

    update_model: =>
      @model.set
        name:      @$('input.name').val()
        image_url: @$('input.image-url').val()
