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

  describe 'generating a unique id', ->
    describe 'initialize with no _id set', ->
      it 'should generate a new id', ->
        @sut = new Quote
        expect(@sut.id).to.exist

      it 'should generate a unique id every time', ->
        quote_1 = new Quote
        quote_2 = new Quote
        expect(quote_1.id).not.to.equal quote_2.id




