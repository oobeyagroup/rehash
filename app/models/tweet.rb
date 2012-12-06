class Tweet < ActiveRecord::Base
  attr_accessible :item, :recording_id

  belongs_to :recording
end
