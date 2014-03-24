mongo_sync = require '../src/extensions/mongo_sync'
Backbone   = require 'backbone'
{MongoClient} = require 'mongodb'

describe 'mongo_sync', ->
  beforeEach (done) ->
    MongoClient.connect global.database, (err, db) =>
      db.dropDatabase done

  describe 'create', ->
    it 'should be callable', ->
      expect(mongo_sync).to.be.a 'function'

    it 'should raise an exception if no url is specified', ->
      model = new Backbone.Model
      expect(=> mongo_sync 'create', model).to.throw Error

    it 'should insert a record in to the database', (done) ->
      model = new Backbone.Model
      model.url = 'quotes'
      mongo_sync 'create', model, success: ->
        MongoClient.connect global.database, (err, db) =>
          db.collection('quotes').count (err, count) ->
            db.close()
            expect(count).to.equal 1
            done()
