module ApplicationHelper
 #arrow collapse
  def render_arrow_collapse_for(parent, href)
    output = ""
    output += "<a data-toggle='collapse' data-parent='#{parent}' href='#{href}' class='glyphicon glyphicon-plus-sign'></a>"
  end


  #IMAGE HELPERS
  #USER AVATARS
  def render_profile_avatar_for(user)
    if user.avatar?
      image_tag(user.avatar.url, class: 'img-responsive img-rounded').html_safe
    else
      image_tag('fallback/default.gif', class: 'img-responsive img-rounded').html_safe
    end
  end

  def render_tiny_avatar_for(user)
    if user.avatar?
      image_tag(user.avatar.tiny.url, class: 'img-rounded').html_safe
    else
      image_tag('fallback/default.gif', height: '20px', width: '20px',  class: 'img-rounded').html_safe
    end
  end

  ## REDNER AVATARS FOR USER SETTINGS  SECTION
  def render_settings_avatar_for(user)
    if user.avatar?
      image_tag(user.avatar.small.url, class: 'img-rounded').html_safe
    else
      image_tag('fallback/default.gif', height: '70px', width: '70px', class: 'img-rounded').html_safe
    end
  end


end
