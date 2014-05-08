Meteor.methods {
  'addLocation': (location) ->
    Location.create {
      name: location.name
      address: location.address
      lat: location.lat
      lng: location.lng
      info: location.info
      more: location.more
      time: location.time
    }
    console.log 'added'
}
