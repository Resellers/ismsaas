requirejs.config
  paths:
    bootstrap: 'js/bootstrap'
  shim:
    bootstrap:
      exports: 'Bootstrap'

require ['backbone', 'path', 'routers/isms_router', 'routers/quotes_router'], (Backbone) =>
  Backbone.history.start pushState: true
  $(document).on 'click', 'a:not([data-bypass])', (evt) ->
    href = $(this).attr 'href'
    protocol = "#{@protocol}//"

    if href.slice(protocol.length) != protocol
      evt.preventDefault()
      Backbone.history.navigate href, true
