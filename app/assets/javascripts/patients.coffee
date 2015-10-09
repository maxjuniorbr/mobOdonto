# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', (event) ->
  $("input[type=\"text\"]").setMask()
  
$(document).on 'ready page:load', (event) ->
  $('#indication_patient_name').autocomplete
  	source: $('#indication_patient_name').data('autocomplete-source')
  	select: (event, ui) ->
      $('#indication_patient_name').val ui.item.label
      $('#patient_indication_patient_id').val ui.item.value
      false
    focus: (event, ui) ->
      $('#indication_patient_name').val ui.item.label
      false
    change: (event, ui) ->
      if !ui.item
        $('#indication_patient_name').val ''
        $('#patient_indication_patient_id').val ''
      return