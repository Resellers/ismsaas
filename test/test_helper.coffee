chai          = require 'chai'
sinon         = require 'sinon'
sinonChai     = require 'sinon-chai'
async         = require 'async'
{MongoClient} = require 'mongodb'

chai.use(sinonChai);

global.database = 'mongodb://127.0.0.1:27017/ismsaas_test'
global.expect   = chai.expect
global.sinon    = sinon

global.scrub_the_database = (db, done=->) ->
  db.collections (err, collections) =>
    async.each collections, (collectionName:name, cb=->) =>
      return cb() if /system.indexes/.test name
      db.collection(name).remove cb
    , done
