class SubsController < ApplicationController
  before_action :require_current_user, only: [:edit, :update]

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_current_user
    sub = Sub.find(params[:id])
    unless current_user.id == sub.moderator_id
      flash.now[:errors] = ["You're not the moderator of this sub!"]
      redirect_to sub_url(sub)
    end
  end

end
