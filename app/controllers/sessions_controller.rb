class SessionsController < ApplicationController
	def create
		auth = request.env['omniauth.auth']
	 	puts auth.to_yaml
	 	user = User.find_by_provider_and_uid(auth["provider"],auth["uid"]) || User.create_from_omniauth(auth)
		# User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to '/index', notice: "Signed in!"
	end
end