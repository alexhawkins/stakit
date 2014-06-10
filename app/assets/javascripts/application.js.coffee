# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require chosen-jquery
#= require best_in_place
#= require best_in_place.purr
#= require jquery.tokeninput
## require select2
#= require bootstrap
#= require bootstrap3-editable/bootstrap-editable
#= require bootstrap-wysihtml5/b3
## require turbolinks
#= require_tree .

# Javascript to enable link to bootstrap tabs/makes tabs persistent
$(document).ready ->
  # show active tab on reload
  $("a[href=\"" + location.hash + "\"]").tab "show"  if location.hash isnt ""
  # remember the hash in the URL without jumping
  $("a[data-toggle=\"tab\"]").on "shown.bs.tab", (e) ->
    if history.pushState
      history.pushState null, null, "#" + $(e.target).attr("href").substr(1)
    else
      location.hash = "#" + $(e.target).attr("href").substr(1)
    return
  return

#X-EDITABLE
jQuery ->
  $("[data-xeditable=true]").each ->
    $(@).editable
      ajaxOptions:
        type: "PUT"
        dataType: "json"
      params: (params) ->
        railsParams = {}
        railsParams[$(@).data("model")] = {}
        railsParams[$(@).data("model")][params.name] = params.value

        return railsParams
  #BEST IN PLACE EDITING
  $(".best_in_place").best_in_place()

  #WSYIHTML5
  $(".answer-textarea").wysihtml5
    "font-styles": false #Font styling, e.g. h1, h2, etc. Default true
    emphasis: true #Italics, bold, etc. Default true
    lists: true #(Un)ordered lists, e.g. Bullets, Numbers. Default true
    html: false #Button which allows you to edit the generated HTML. Default false
    link: true #Button to insert a link. Default true
    image: false #Button to insert an image. Default true,
    color: false #Button to change color of font
