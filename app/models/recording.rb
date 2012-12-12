class Recording < ActiveRecord::Base
  attr_accessible :criteria, :duration, :name, :rehash, :start, :uid, :date_text, :time_text

  belongs_to :user
  has_many :tweets
end
