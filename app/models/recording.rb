class Recording < ActiveRecord::Base
  attr_accessible :criteria, :duration, :name, :rehash, :start, :uid

  belongs_to :user
  has_many :tweets
end
