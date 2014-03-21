define ['backbone'], (Backbone) ->
  class Messages extends Backbone.Collection
    url: '/api/v1/messages'
