class ApplicationController < ActionController::Base
	def favorite_text
		return @favorite_exists? "UnFavorite" : "Favorite"  #True -> "UnFavorite",  False -> "Favorite"
	end
	

	helper_method :favorite_text
end
