Backbone   = require 'backbone'
_          = require 'underscore'
MongoModel = require './mongo_model'
uuid       = require 'node-uuid'

class Quote extends MongoModel
  initialize: =>
    @set _id: uuid.v1()

  # validate: (attributes={}, options={}) =>
  #   unless attributes.ism_id? || @has('ism_id')
  #     ism_id: ["cannot be blank"]

module.exports = Quote
