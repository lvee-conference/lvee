class Badge < ApplicationRecord
  attr_accessible :top, :bottom, :tags

  belongs_to :conference_registration
end
