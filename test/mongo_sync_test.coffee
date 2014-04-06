mongo_sync = require '../src/extensions/mongo_sync'
_          = require 'underscore'
async      = require 'async'
Backbone   = require 'backbone'
MongoModel = require '../src/models/mongo_model'
{MongoClient} = require 'mongodb'

describe 'mongo_sync', ->
  before (done) ->
    MongoClient.connect global.database, (err, @db) =>
      done err

  beforeEach (done) ->
    scrub_the_database @db, done

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

    describe 'inserting a valid record with optional attrs', ->
      beforeEach (done) ->
        model = new Backbone.Model bar: 'foo'
        model.url = 'isms'
        mongo_sync 'create', model, attrs: {bar: 'baz'}, success: =>
          done()

      it 'should override the model data with the attr data', (done) ->
        @db.collection('isms').findOne (err, result) =>
          expect(result.bar).to.equal 'baz'
          done()

  describe 'update', ->
    describe 'with a record in the database', ->
      beforeEach (done) ->
        @db.collection('quotes').insert foo: 'bar', =>
          @db.collection('quotes').findOne foo: 'bar', (err, result) =>
            @model = new MongoModel result
            @model.urlRoot = 'quotes'
            done()

      describe 'when the record is changed and saved', ->
        beforeEach (done) ->
          @model.set foo: 'spoo'
          mongo_sync 'update', @model, success: (response) =>
            done()

        it 'should update the record', (done) ->
          @db.collection('quotes').findOne _id: @model.id, (err, result) =>
            expect(result.foo).to.equal 'spoo'
            done()

  describe 'read', ->
    describe 'when reading from a collection', ->
      describe 'with no records in the database', ->
        it 'should call its callback with empty results', (done) ->
          collection = new Backbone.Collection
          collection.url = 'empty_collection'
          mongo_sync 'read', collection, success: (response) =>
            expect(_.size response).to.equal 0
            done()

      describe 'with a single record in the database', ->
        it 'should call its callback with empty results', (done) ->
          @db.collection('quotes').insert foo: 'bar', =>
            collection = new Backbone.Collection
            collection.url = 'quotes'
            mongo_sync 'read', collection, success: (response) =>
              expect(_.last(response).foo).to.equal 'bar'
              done()

        it 'should only return data from the whitelist', (done) ->
          @db.collection('quotes').insert foo: 'bar', faz: 'baz', =>
            @db.collection('quotes').findOne (err, result) =>
              collection = new Backbone.Collection
              collection.url = 'quotes'
              mongo_sync 'read', collection, fields: {foo: 1}, success: (response) =>
                expect(_.last(response).foo).to.equal 'bar'
                expect(_.last(response).faz).to.be.undefined
                done()

    describe 'when reading from a model', ->
      describe 'with no records in the database', ->
        it 'should call its callback with a null', (done) ->
          model = new MongoModel _id: '000000000000000000000000'
          model.urlRoot = 'empty_collection'
          mongo_sync 'read', model, success: (response) =>
            expect(response).to.be.null
            done()

      describe 'with a single record in the database', ->
        it 'should call its callback with model data', (done) ->
          @db.collection('quotes').insert foo: 'bar', =>
            @db.collection('quotes').findOne (err, result) =>
              model = new MongoModel _id: result._id
              model.urlRoot = 'quotes'
              mongo_sync 'read', model, success: (response) =>
                expect(response).to.be.a 'object'
                expect(response.foo).to.equal 'bar'
                done()

