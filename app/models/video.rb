class Video < ActiveRecord::Base
  belongs_to :user
  validates :link, presence: true
  validates :user, presence: true
  has_many :activities, as: :trackable, dependent: :destroy

  auto_html_for :link do
    html_escape
    image
    youtube(:width => 560, :height => 315, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
