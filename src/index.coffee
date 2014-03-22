express  = require 'express'
http     = require 'http'
path     = require 'path'

messages_controller = require './controllers/messages_controller'

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

app.get '/api/v1/messages', messages_controller.index
app.use (req, res) ->
  res.sendfile path.join(__dirname, '../public/index.html')

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get 'port'}"
