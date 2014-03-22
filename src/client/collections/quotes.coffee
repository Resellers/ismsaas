define ['backbone', 'models/quote'], (Backbone, Quote) ->
  class Messages extends Backbone.Collection
    model: Quote
    url: '/api/v1/messages'
