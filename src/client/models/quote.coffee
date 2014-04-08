define ['backbone'], (Backbone) ->
  class Quote extends Backbone.Model
    idAttribute: '_id'
    urlRoot: => "/api/v1/isms/#{@get 'ism_id'}/quotes"
