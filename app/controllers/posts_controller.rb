class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:show, :new, :edit, :create, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def set_favorite_exists
    #@favorite_exists = Favorite.where(post: post) == [] ? false : true
  end

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    @post = Post.new    #create new post のための @post
    #@post_show_arr = []
    #set_favorite_exists
    #@favorite_exists = Favorite.where(post: post) == [] ? false : true
  end

  # GET /posts/1 or /posts/1.json
  def show
    @favorite_exists = Favorite.where(post: @post, user_id: current_user.id) == [] ? false : true
    @post = Post.find(params[:id])
    @comments = @post.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = Comment.new
  end

  def ShowUser

  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
    @post.user_id = current_user.id
    #@post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

   def search
     @users = User.where("email LIKE ?", "%" +params[:q]+ "%")
   end

  # POST /posts or /posts.json
  def create
    #@post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to "/posts##{@post.id}", notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to "/posts##{@post.id}", notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    #redirect_to schedules_path, notice: "Please login first !" if @schedule.nil?
    redirect_to "/posts", notice: "PLEASE LOGIN FIRST !" if @post.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
      @post.user_id = current_user.id
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id, images: [])
    end
end
