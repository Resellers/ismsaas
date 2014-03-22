define ['backbone', 'templates/message_form'], (Backbone) ->
  class MessageFormView extends Backbone.View
    template: JST['message_form']
    render: =>
      @$el.html @template()
