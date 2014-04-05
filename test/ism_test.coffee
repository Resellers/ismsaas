{MongoClient} = require 'mongodb'
Ism           = require '../src/models/ism'
_             = require 'underscore'

describe 'ism', ->
  before (done) ->
    MongoClient.connect global.database, (err, @db) =>
      done err

  beforeEach (done) ->
    scrub_the_database @db, done

  after ->
    @db?.close()

  describe 'quotes', ->
    it 'should be instantiated as an empty something', ->
      model = new Ism
      expect(model.quotes.isEmpty()).to.be.true

    describe 'when a quote is added and the ism is saved', ->
      beforeEach (done) ->
        @model = new Ism
        @model.quotes.add text: 'This is mah text'
        @model.save {}, success: => done()

      it 'should save the quote as well', (done) ->
        @db.collection('isms').findOne (err, record) =>
          expect(_.size record.quotes).to.equal 1
          done()

      describe 'when the ism is then fetched', ->
        it 'should include the quote', (done) ->
          @db.collection('isms').findOne (err, record) =>
            model = new Ism _id: record._id
            model.fetch success: =>
              expect(model.quotes.first().get 'text').to.equal 'This is mah text'
              done()


