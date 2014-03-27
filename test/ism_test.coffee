{MongoClient} = require 'mongodb'
Ism           = require '../src/models/ism'
_             = require 'underscore'

xdescribe 'ism', ->
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
          model = new Ism id: @model.id
          model.fetch success: =>
            console.log model.toJSON()
            expect(model.quotes.first().get 'text').to.equal 'This is mah text'
            done()


