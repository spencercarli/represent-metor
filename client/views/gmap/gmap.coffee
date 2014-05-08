GoogleMaps.init
  sensor: true #optional
  # language: "de" #optional
, ->
  mapOptions =
    zoom: 4
    # mapTypeId: google.maps.MapTypeId.SATELLITE

  # Initialize map
  center = new google.maps.LatLng(39.5, -98.35)
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  map.setCenter center

  locations = Location.find()
  locations.forEach (location) ->
    mapIt(location, map)


mapIt = (location, map) ->
  latlng = new google.maps.LatLng(location.lat, location.lng)
  new google.maps.Marker({
      position: latlng,
      map: map,
      title: location.name
  })
