class PostsController < ApplicationController

  before_action :require_authorship, only: [:edit, :update]

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to post_url(@post.id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    @top_level_comments = @post.comments.where(parent_comment_id: nil)
    render :show
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  def require_authorship
    post = Post.find(params[:id])
    unless current_user.id == post.author_id
      flash.now[:errors] = ["You're not the author of this post!"]
      redirect_to post_url(post)
    end
  end

end
