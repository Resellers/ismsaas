Ism  = require '../models/ism'
Isms = require '../collections/isms'

class IsmsController
  @index: (request, response) ->
    isms = new Isms
    isms.fetch fields: {quotes: 0}, success: =>
      response.send isms.toJSON()

  @create: (request, response) ->
    ism = new Ism request.body
    ism.save {}, success: ->
      response.send ism.toJSON(), 201

  @update: (request, response) ->
    ism = new Ism _id: request.params.id
    ism.save request.body, success: ->
      response.send null, 204

  @show: (request, response) ->
    ism = new Ism _id: request.params.id
    ism.fetch success: ->
      response.send ism.toJSON()

module.exports = IsmsController
