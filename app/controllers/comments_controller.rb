class CommentsController < ApplicationController

  

  def create
    @posts = Post.all
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    #redirect_to post_path(@post)
    #redirect_to "/posts##{@post.id}"
    #redirect_to :back
    #redirect_back(fallback_location: root_path(anchor: "form-create"))
    respond_to do |format|
      format.js
    end

    @mark = 0
  end
  
  def destroy
      @posts = Post.all
      @post = Post.find(params[:post_id])
      @a = @post.id
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      #redirect_to post_path(@post)
      #redirect_to "/posts##{@post.id}"
      #redirect_to :back
      #redirect_back(fallback_location: root_path(anchor: 'form-create'))
      respond_to do |format|
        format.js
      end

      @mark = 0
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
