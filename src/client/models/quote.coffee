define ['backbone'], (Backbone) ->
  class Quote extends Backbone.Model
    urlRoot: '/api/v1/quotes'
