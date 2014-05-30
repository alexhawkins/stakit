module AnswersHelper
  ## REDNER AVATARS FOR ANSWERS SECTION
  def render_answer_avatar_for(user)
    if user.avatar?
      image_tag(user.avatar.tiny.url, class: 'media-object tiny-thumbnail').html_safe
    else
      image_tag('fallback/default.gif', height: '30px', width: '30px', class: 'media-object tiny-thumbnail').html_safe
    end
  end
end
