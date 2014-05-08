Template.addLocation.events
  'submit form': (event, t) ->
    event.preventDefault()

    address = t.find('#address').value
    location =
      name: t.find('#name').value
      address: address
      time: t.find('#time').value
      info: t.find('#info').value
      more: t.find('#more').value

    geo = new google.maps.Geocoder()
    geo.geocode { address: address }, (results, status) ->
      if status is google.maps.GeocoderStatus.OK
        location.lat = results[0].geometry.location.k
        location.lng = results[0].geometry.location.A
        Meteor.call 'addLocation', location
        $('#addLocation').toggle()
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
      else
        alert "Geocode was not successful for the following reason: " + status
