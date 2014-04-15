define [
  'models/ism'
  'views/preview_view'
  ], (Ism, PreviewView) ->

  class PreviewRouter extends Backbone.Router
    routes:
      'preview/:id'                 : 'show'

    show: (id) =>
      model = new Ism _id: id
      model.fetch()
      view = new PreviewView model: model
      $('body').html view.render()

  new PreviewRouter
