class TopController < ApplicationController
  def main
    redirect_to "/top/login"
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user and BCrypt::Password.new(user.pass) == params[:pass]
      flash[:notice] = 'ログイン成功しました'
      session[:login_uid] = user.uid
      redirect_to root_path
    else
      #flash[:notice] = 'ログイン失敗'
      render 'login'
    end
  end

  def logout
    #TODO,,OK: ログアウトに成功したことをユーザに知らせる 
    flash[:notice] = 'ログアウトしました'
    session.delete(:login_uid)
    redirect_to root_path
  end
end
