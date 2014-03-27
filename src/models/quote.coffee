Backbone   = require 'backbone'
mongo_sync = require '../extensions/mongo_sync'

class Quote extends Backbone.Model
  sync: mongo_sync

  # validate: (attributes={}, options={}) =>
  #   unless attributes.ism_id? || @has('ism_id')
  #     ism_id: ["cannot be blank"]

module.exports = Quote
