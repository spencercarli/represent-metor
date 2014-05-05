GoogleMaps.init
  sensor: true #optional
  # language: "de" #optional
, ->
  mapOptions =
    zoom: 4
    # mapTypeId: google.maps.MapTypeId.SATELLITE

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  map.setCenter new google.maps.LatLng(39.5, -98.35)
  return
