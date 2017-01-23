class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      log_in_user!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["You logged in incorrectly"]
      render :new
    end
  end

  def destroy
    log_out_user!
    redirect_to new_session_url
  end

end
