# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
  #alert "page ha loaded!"

  addTagToThisStuff: ()->
    $.ajax
      url: 'add_tag_action_ajax'
      type: 'POST'
      data:
        tag_id: $('#some-url').val()
      success: (data, status, response) ->
        #full new tag to last post
        alert 'ok!'
      error: ->
        #show error info

      dataType: "json"


