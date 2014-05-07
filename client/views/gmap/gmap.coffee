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
    mapIt(location.lat, location.lng, map)


mapIt = (lat, lng, map) ->
  latlng = new google.maps.LatLng(lat, lng)
  new google.maps.Marker({
      position: latlng,
      map: map,
      title: 'Hello World!'
  })
