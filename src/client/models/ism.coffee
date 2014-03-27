define ['backbone'], (Backbone) ->
  class Ism extends Backbone.Model
    urlRoot: '/api/v1/isms'
    idAttribute: '_id'
