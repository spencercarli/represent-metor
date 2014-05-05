Template.addLocation.events
  'submit form': (event, t) ->
    event.preventDefault()
    location =
      name: t.find('#name').value
      address: t.find('#address').value
    Meteor.call 'addLocation', location
