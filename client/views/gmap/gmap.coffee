GoogleMaps.init
  sensor: true #optional
  # language: "de" #optional
, ->
  mapOptions =
    zoom: 4
    # mapTypeId: google.maps.MapTypeId.SATELLITE

  center = new google.maps.LatLng(39.5, -98.35)

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  map.setCenter center

  myLatlng = center
  address = "299 East Sixth Street, Cincinnati, OH"

  geo = new google.maps.Geocoder()
  geo.geocode { address: address }, (results, status) ->
    if status is google.maps.GeocoderStatus.OK
      lat = results[0].geometry.location.k
      lng = results[0].geometry.location.A
      latlng = lat + "," + lng
      cincylatlng = new google.maps.LatLng( lat, lng )

      marker = new google.maps.Marker({
          position: cincylatlng,
          map: map,
          title: 'Hello World!'
      })
    else
      alert "Geocode was not successful for the following reason: " + status
