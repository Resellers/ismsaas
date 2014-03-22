express  = require 'express'
http     = require 'http'
path     = require 'path'

quotes_controller = require './controllers/quotes_controller'

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

app.get  '/api/v1/quotes', quotes_controller.index
app.post '/api/v1/quotes', quotes_controller.create
app.use (req, res) ->
  return res.send 404 unless req.method == 'GET'
  res.sendfile path.join(__dirname, '../public/index.html')

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get 'port'}"
