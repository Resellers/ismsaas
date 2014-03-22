define ['backbone'], (Backbone) ->
  class Message extends Backbone.Model
    urlRoot: '/api/v1/messages'
