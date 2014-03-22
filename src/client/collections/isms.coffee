define ['backbone', 'models/ism'], (Backbone, Ism) ->
  class Isms extends Backbone.Collection
    model: Ism
    url: '/api/v1/isms'
