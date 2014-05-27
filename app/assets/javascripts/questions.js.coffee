# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#question_topic_tokens').tokenInput '/topics.json',
    theme: 'facebook'
    prePopulate: $('#question_topic_tokens').data('load')
    preventDuplicates: true