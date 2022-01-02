class FavoritesController < ApplicationController
  def update
    favorite = Favorite.where(post: Post.find(params[:post]), user_id: current_user.id)
    if favorite == []
      Favorite.create(post: Post.find(params[:post]), user_id: current_user.id)
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


  def UpdateIndex
    @posts = Post.all
    favorite = Favorite.where(post: Post.find(params[:post]), user_id: current_user.id)
    if favorite == []
      Favorite.create(post: Post.find(params[:post]), user_id: current_user.id)
      @favorite_exists = true
    else
      favorite.destroy_all
      @favorite_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end

    @ppost = Post.find(params[:post])
    @favorite_exists = Favorite.where(post: @ppost) == [] ? false : true
    @mark = 0
  end

end
