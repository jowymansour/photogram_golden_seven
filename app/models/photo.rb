class Photo < ActiveRecord::Base
  validates :source, presence: true

end
