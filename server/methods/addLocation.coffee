Meteor.methods {
  'addLocation': (location) ->
    Location.create {
      name: location.name
    }
    console.log 'added'
}
