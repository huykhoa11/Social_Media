class FavoritesController < ApplicationController
  def update
  	favorite = Favorite.where(post: Post.find(params[:post]))
  	if favorite == []
  		Favorite.create(post: Post.find(params[:post]))
  		@favorite_exists = true
  	else
  		favorite.destroy_all
  		@favorite_exists = false
  	end
  	respond_to do |format|
  		format.html {}
  		format.js {}
  	end
  	
  end
end
