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

  # Probably a better way to do this
  Meteor.setTimeout(->
    locations = Location.find()
    console.log locations.count()
    locations.forEach (location) ->
      mapIt(location, map)
  , 2000)

  # locations = Location.find()
  # while locations.count() is 0
  #   locations = Location.find()
  #
  # locations.forEach (location) ->
  #   mapIt(location, map)


mapIt = (location, map) ->
  latlng = new google.maps.LatLng(location.lat, location.lng)
  marker = new google.maps.Marker({
      position: latlng,
      map: map,
      title: location.name,
      animation: google.maps.Animation.DROP
  })
  addInfo(map, marker, location)

addInfo = (map, marker, location) ->
  google.maps.event.addListener marker, "click", ->
    info = $('#add-info')
    info.fadeOut(200, ->
      info.hide()
      info.html(
        "<h2>" + location.name + "</h2>" +
        "<p>" + location.info + "</p>" +
        "<p>" + location.time + "</p>" +
        "<p>" + location.address + "</p>" +
        "<a class='btn btn-primary' target='_blank' href='" + location.more + "'>Learn More</a>"
      )
      info.fadeIn(200)
    )
