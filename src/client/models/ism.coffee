define ['backbone', 'collections/quotes'], (Backbone, Quotes) ->
  class Ism extends Backbone.Model
    urlRoot: '/api/v1/isms'
    idAttribute: '_id'

    initialize: =>
      @quotes = new Quotes @get 'quotes'
      @quotes.ism_id = @id
      @on 'change:quotes', =>
        @quotes.set @get 'quotes'
