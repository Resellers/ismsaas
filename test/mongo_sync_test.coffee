mongo_sync = require '../src/extensions/mongo_sync'
_          = require 'underscore'
Backbone   = require 'backbone'
{MongoClient} = require 'mongodb'

describe 'mongo_sync', ->
  before (done) ->
    MongoClient.connect global.database, (err, @db) =>
      done err

  beforeEach (done) ->
    @db.dropDatabase done

  after ->
    @db?.close()

  describe 'create', ->
    it 'should be callable', ->
      expect(mongo_sync).to.be.a 'function'

    it 'should raise an exception if no url is specified', ->
      model = new Backbone.Model
      expect(=> mongo_sync 'create', model).to.throw Error

    describe 'inserting a valid record', ->
      beforeEach (done) ->
        model = new Backbone.Model spoo: 'asdf'
        model.url = 'quotes'
        mongo_sync 'create', model, success: =>
          done()

      it 'should insert a record in to the database', (done) ->
        @db.collection('quotes').count (err, count) =>
          expect(count).to.equal 1
          done()

      it 'should save the data that was passed in', (done) ->
        @db.collection('quotes').findOne (err, result) =>
          expect(result.spoo).to.equal 'asdf'
          done()


  describe 'read', ->
    it 'should call its callback with empty results', (done) ->
      model = new Backbone.Model
      model.url = 'quotes'
      @db.collection('quotes').insert foo: 'bar', =>
        mongo_sync 'read', model, success: (response) =>
          expect(_.last(response).foo).to.equal 'bar'
          done()


