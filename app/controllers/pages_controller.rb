class PagesController < ApplicationController


	def about
		render template: "pages/about.html.erb" 
	end

end
