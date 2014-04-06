{MongoClient} = require 'mongodb'
_             = require 'underscore'
Ism           = require '../src/models/ism'
Quote         = require '../src/models/quote'
MongoModel    = require '../src/models/mongo_model'

describe 'quote', ->
  before (done) ->
    MongoClient.connect global.database, (err, @db) =>
      done err

  beforeEach (done) ->
    scrub_the_database @db, done

  after ->
    @db?.close()



