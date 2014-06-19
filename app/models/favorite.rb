class Favorite < ActiveRecord::Base
  belongs_to :stack
  belongs_to :user
end
