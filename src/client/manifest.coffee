requirejs.config
  paths:
    bootstrap: 'js/bootstrap'
  shim:
    bootstrap:
      exports: 'Bootstrap'

require ['backbone', 'routers/messages_router'], (Backbone) =>
  Backbone.history.start()
