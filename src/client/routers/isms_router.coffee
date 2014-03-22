define [
  'models/ism'
  'collections/isms'
  'views/isms_list_view'
  'views/ism_form_view'
  ], (Ism, Isms, IsmsListView, IsmFormView) ->

  class IsmsRouter extends Backbone.Router
    initialize: =>
      @on 'route', =>
        $('.navbar-nav li').removeClass 'active'
        $('.navbar-nav li.nav-isms').addClass 'active'

    routes:
      ''         : 'index'
      'isms/new' : 'new'

    index: =>
      collection = new Isms
      collection.fetch()
      view = new IsmsListView collection: collection
      $('#main-content').html view.render()

    new: =>
      model = new Ism
      view  = new IsmFormView model: model
      $('#main-content').html view.render()

  new IsmsRouter
