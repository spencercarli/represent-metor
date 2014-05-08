Template.home.rendered = ->

  #SEO Page Title & Description
  document.title = "Represent Meteor"
  $("<meta>", { name: "description", content: "Visual representation of the Meteor community." }).appendTo "head"
