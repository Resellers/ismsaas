chai      = require 'chai'
sinon     = require 'sinon'
sinonChai = require 'sinon-chai'

chai.use(sinonChai);

global.database = 'mongodb://127.0.0.1:27017/ismsaas_test'
global.expect   = chai.expect
global.sinon    = sinon
