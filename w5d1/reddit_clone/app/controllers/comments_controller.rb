class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    # @comment.parent_id = ??
    if @comment.save
      @post = Post.find(params[:comment][:post_id])

      if @comment.parent_comment_id
        redirect_to comment_url(@comment.parent_comment)
      else
        redirect_to post_url(@post)
      end


    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end
  #
  # def edit
  # end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end

end
