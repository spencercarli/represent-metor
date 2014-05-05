Router.map ->
  @route 'home',
    path: '/',
    onBeforeAction: ->
      Meteor.subscribe 'locations'

  @route 'dashboard',
    path: '/dashboard'

  @route 'notFound',
    path: '*'
    where: 'server'
    action: ->
      @response.statusCode = 404
      @response.end Handlebars.templates['404']()
