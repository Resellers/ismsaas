define [
  'models/ism'
  'collections/isms'
  'views/isms_list_view'
  'views/ism_form_view'
  'views/ism_view'
  ], (Ism, Isms, IsmsListView, IsmFormView, IsmView) ->

  class IsmsRouter extends Backbone.Router
    initialize: =>
      @on 'route', =>
        $('.navbar-nav li').removeClass 'active'
        $('.navbar-nav li.nav-isms').addClass 'active'

    routes:
      ''         : 'index'
      'isms/new' : 'new'
      'isms/:id' : 'show'

    index: =>
      collection = new Isms
      collection.fetch()
      view = new IsmsListView collection: collection
      $('#main-content').html view.render()

    new: =>
      model = new Ism
      view  = new IsmFormView model: model
      $('#main-content').html view.render()

    show: (id) =>
      model = new Ism _id: id
      model.fetch()
      view = new IsmView model: model
      $('#main-content').html view.render()


  new IsmsRouter
