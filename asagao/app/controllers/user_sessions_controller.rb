class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  def new
    @user = User.new
  end
 
  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: 'ログイン しました。')
    else
      flash.now[:alert] = 'User ID もしくは パスワードが間違っています。'
      render action: 'new'
    end
  end
 
  def destroy
    logout
    redirect_to(:users, notice: 'ログアウト しました。')
  end
end