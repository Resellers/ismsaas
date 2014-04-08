express  = require 'express'
http     = require 'http'
path     = require 'path'

# Config
global.database = 'mongodb://127.0.0.1:27017/ismsaas'

quotes_controller = require './controllers/quotes_controller'
isms_controller   = require './controllers/isms_controller'

app = express()

# all environments
port = if app.get('env') == 'development' then 3000 else 80

app.set 'port', port
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(app.router);
app.use express.static path.join(__dirname, '../public')
app.use express.static path.join(__dirname, 'client')

# development only
app.use express.errorHandler() if 'development' == app.get('env')

app.get    '/api/v1/isms',     isms_controller.index
app.get    '/api/v1/isms/:id', isms_controller.show
app.post   '/api/v1/isms',     isms_controller.create
app.post   '/api/v1/isms/:ism_id/quotes', quotes_controller.create
app.delete '/api/v1/isms/:ism_id/quotes/:quote_id', quotes_controller.destroy

app.use (req, res) ->
  return res.send 404 unless req.method == 'GET'
  res.sendfile path.join(__dirname, '../public/index.html')

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get 'port'}"
