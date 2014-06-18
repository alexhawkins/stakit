#INFINITE SCROLL
jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_activities_url = $('.pagination .next_page a').attr('href')
      if more_activities_url && $(window).scrollTop() > $(document).height() - $(window).height() - 100
          $('.pagination').html("<img src='fallback/ajax-loader.gif' alt='Loading...' title='Loading...' />")
          $.getScript more_activities_url
      return
  return