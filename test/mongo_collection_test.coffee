MongoCollection = require '../src/collections/mongo_collection'
{MongoClient} = require 'mongodb'

describe 'MongoCollection', ->
  before (done) ->
    MongoClient.connect global.database, (err, @db) =>
      done err

  beforeEach (done) ->
    scrub_the_database @db, done

  after ->
    @db?.close()

  describe 'fetch', ->
    it 'should update the collection with data from the db', (done) ->
      @db.collection('quotes').insert foo: 'bar', =>
        collection = new MongoCollection
        collection.url = 'quotes'
        collection.fetch success: =>
          expect(collection.size()).to.equal 1
          done()

    it 'should retrieve the attribute data from the db', (done) ->
      @db.collection('quotes').insert foo: 'bar', =>
        collection = new MongoCollection
        collection.url = 'quotes'
        collection.fetch success: =>
          expect(collection.first().get 'foo').to.equal 'bar'
          done()
