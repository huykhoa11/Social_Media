class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters,
					if: :devise_controller?

	def favorite_text
		return @favorite_exists? "UnFavorite" : "Favorite"  #True -> "UnFavorite",  False -> "Favorite"
	end

	helper_method :favorite_text

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
		devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
	end
	

	
end
