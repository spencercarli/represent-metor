Meteor.methods {
  'addLocation': (location) ->
    Location.create {
      name: location.name
      address: location.address
    }
    console.log 'added'
}
