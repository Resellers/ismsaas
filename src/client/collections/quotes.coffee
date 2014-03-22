define ['backbone', 'models/quote'], (Backbone, Quote) ->
  class Quotes extends Backbone.Collection
    model: Quote
    url: '/api/v1/quotes'
