define ['backbone', 'templates/messages_list'], (Backbone) ->
  class MessagesListView extends Backbone.View
    template: JST['messages_list']
    render: =>
      @$el.html @template()
