MongoModel = require '../src/models/mongo_model'
{MongoClient} = require 'mongodb'

describe 'MongoModel', ->
  before (done) ->
    MongoClient.connect global.database, (err, @db) =>
      done err

  beforeEach (done) ->
    scrub_the_database @db, done

  after ->
    @db?.close()

  describe 'id', ->
    it 'should parse _id as id', ->
      model = new MongoModel _id: 3
      expect(model.id).to.equal 3

  describe 'fetch', ->
    it 'should update the model with data from the db', (done) ->
      @db.collection('quotes').insert foo: 'bar', =>
        @db.collection('quotes').findOne (err, result) =>
          model = new MongoModel _id: result._id
          model.urlRoot = 'quotes'
          model.fetch success: =>
            expect(model.get 'foo').to.equal 'bar'
            done()
