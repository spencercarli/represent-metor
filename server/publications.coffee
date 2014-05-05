Meteor.publish 'locations', ->
  Location.find()
