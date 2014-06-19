# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# FOR AUTOCOMPLETE FORMS
jQuery ->
  $('#stack_supplement_supplement_name').autocomplete
    source: $("#stack_supplement_supplement_name").data('autocomplete-source')
    selectFirst: true #here
    minLength: 2
    delay: 500
    messages:
       noResults: ""
       results: ->
        
# FOR CHOSEN SELECTION FORMS
  $('#stack_supplement_supplement_id').chosen()
# TOOLTIPS
  $('.supplement-tip').tooltip()

