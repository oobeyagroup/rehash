class Recording < ActiveRecord::Base
  attr_accessible :criteria, :duration, :name, :rehash, :start, :uid, :date_text, :time_text, :end_time

  belongs_to :user
  has_many :tweets
end
