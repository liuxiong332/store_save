# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

processItem = (method, event) ->
  regRes = /item_(\d+)/.exec(event.target.id)
  return if not regRes?
  itemId = regRes[1]
  $.ajax
    type: method
    url: "#{window.location.pathname}/items/#{itemId}"
    contentType: "application/json"
    data:
      _method: method
  event.stopPropagation()

$(document).ready ->
  $(".remove_item_from_storage").click (event) ->
    processItem 'DELETE', event

  $(".add_item_into_storage").click (event) ->
    processItem 'PUT', event
