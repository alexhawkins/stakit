module ApplicationHelper
  #allow logging in with devise from anywhere in app
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  #REDCARPET MARKDOWN TEXT
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(safe_links_only: true, hard_wrap: true, filter_html: true, prettify: true)
    extensions = {fenced_code_blocks: true, autolink: true, highlight: true, strikethrough: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  #ERROR FORM HELPERS

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

   def form_group_question(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group answer-form ask-question-form'
    end
  end

  def form_group_answer(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group answer-form'
    end
  end



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

  def render_follower_avatar_for(follower)
    if follower.avatar?
      image_tag(follower.avatar.followers.url, class: 'img-responsive img-rounded tiny-thumbnail').html_safe
    else
      image_tag('fallback/default.gif', height: '35px', width: '35px',  class: 'img-responsive img-rounded tiny-thumbnail').html_safe
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

   def render_user_link_avatar_for(user)
      output = ""
      output += "
        <ul class='media-list'>
          <li class='media'>
          <a class='pull-left' href='#'>
             #{render_settings_avatar_for(user)}
          </a>
            <div class='media-body'>
              <h5 class='media-heading'>#{user.name}</h5>
               <small><em>#{user.shortbio}</em></small>
               <small>#{user.location}</small>
               </small>
            </div>
          </li>
        </ul>"
    output
  end

end
