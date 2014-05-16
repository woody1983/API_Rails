class Episode < ActiveRecord::Base
  validates :title, presence: true
end
