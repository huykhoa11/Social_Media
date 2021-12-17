class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.save
    redirect_to "/posts"
  end
  
  def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
