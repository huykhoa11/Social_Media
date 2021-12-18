class ApplicationController < ActionController::Base
	def favorite_text
		return @favorite_exists? "UnFavorite" : "Favorite"
		console.log(@favorite_exist)
	end

	helper_method :favorite_text
end
