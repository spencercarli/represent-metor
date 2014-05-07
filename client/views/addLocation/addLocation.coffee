Template.addLocation.events
  'submit form': (event, t) ->
    event.preventDefault()

    address = t.find('#address').value
    location =
      name: t.find('#name').value
      address: address

    geo = new google.maps.Geocoder()
    geo.geocode { address: address }, (results, status) ->
      if status is google.maps.GeocoderStatus.OK
        location.lat = results[0].geometry.location.k
        location.lng = results[0].geometry.location.A
        Meteor.call 'addLocation', location
      else
        alert "Geocode was not successful for the following reason: " + status
