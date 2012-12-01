class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :nickname, :token, :secret

  def self.from_omniauth(auth)
  	where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
  	create! do |user|
  		user.provider = auth["provider"]
  		user.uid = auth["uid"]
  		user.name = auth["info"]["name"]
  		user.nickname = auth["info"]["nickname"]
  		user.token = auth["credentials"]["token"]
  		user.secret = auth["credentials"]["secret"]
  	end
  end
  
end
