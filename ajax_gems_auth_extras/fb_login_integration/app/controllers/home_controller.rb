class HomeController < ApplicationController
    def index
		session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/facebook/show')
		@auth_url = session[:oauth].url_for_oauth_code(:permissions=>"read_stream")
		puts session.to_s + "<<< session"
		respond_to do |format|
			format.html { }
		end
	end

	def show
		session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/facebook/show')
		if params[:code]
			# acknowledge code and get access token from FB
			session[:access_token] = session[:oauth].get_access_token(params[:code])
		end
		# auth established, now do a graph call:
		@api = Koala::Facebook::API.new(session[:access_token])

		begin
			@profile = @api.get_object("/me")
			@friends = @api.get_connections("me", "friends")
		end

		respond_to do |format|
			format.html { }
		end
	end

	def logout
		redirect_to "https://www.facebook.com/logout.php?next=http://localhost:3000/facebook&access_token=#{session[:access_token]}"
	end

end
