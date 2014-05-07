Meteor.methods {
  'addLocation': (location) ->
    Location.create {
      name: location.name
      address: location.address
      lat: location.lat
      lng: location.lng
    }
    console.log 'added'
}
