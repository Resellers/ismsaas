Ism  = require '../models/ism'
Isms = require '../collections/isms'

class IsmsController
  @index: (request, response) ->
    isms = new Isms
    isms.fetch =>
      response.send isms.toJSON()

  @create: (request, response) ->
    ism = new Ism request.body
    ism.save {}, success: ->
      response.send ism.toJSON(), 201

module.exports = IsmsController
