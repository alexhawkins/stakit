# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# FOR AUTOCOMPLETE FORMS
jQuery ->
  $('#stack_supplement_supplement_name').autocomplete
    source: $('#stack_supplement_supplement_name').data('autocomplete-source')

jQuery ->
  $('#js-stack-supplements').sortable
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
    
# FOR CHOSEN SELECTION FORMS
jQuery ->
  $('#stack_supplement_supplement_id').chosen()


