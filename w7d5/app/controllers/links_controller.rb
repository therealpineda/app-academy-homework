class LinksController < ApplicationController

  before_action :require_logged_in
  before_action :require_authorship, only: [:edit, :update]


  def new
    @link = Link.new
    render :new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def index
    @link = Link.all
    render :index
  end

  def show
    @link = Link.find(params[:id])
    render :show
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attribute(link_params)
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end

  def require_authorship
    link = Link.find(params[:id])
    if current_user.id != link.user.id
      redirect_to link_url(link)
    end
  end

end
