MongoModel = require '../src/models/mongo_model'

describe 'MongoModel', ->
  describe 'id', ->
    it 'should parse _id as id', ->
      model = new MongoModel _id: 3
      expect(model.id).to.equal 3
