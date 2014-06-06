class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true
  default_scope { order('created_at DESC') }
  #make sure that specific activities are only created once per user

  auto_html_for :link do
    html_escape
    image
    youtube(:width => 200, :height => 150, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
