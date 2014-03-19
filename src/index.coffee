express  = require 'express'
http     = require 'http'
path     = require 'path'

isms_controller = require './controllers/isms_controller'

app = express()

# all environments
port = if app.get('env') == 'development' then 3000 else 80

app.set 'port', port
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(app.router);
app.use express.static path.join(__dirname, 'public')

# development only
app.use express.errorHandler() if 'development' == app.get('env')

app.get '/', isms_controller.index

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get 'port'}"
