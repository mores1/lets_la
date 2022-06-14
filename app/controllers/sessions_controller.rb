class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(name: session_params[:name]) #name入力値から既存nameを検索
    if @user&.authenticate(session_params[:password]) #該当name発見時、メソッドauthenticateでpassと整合性確認
      session[:user_id] = @user.id #ログイン成功時ログイン状態保持する為sessionでuser_idを保持させる
      redirect_to spots_path
    else
      redirect_to request.referer
      flash[:alert] = "ログインできません。"
    end
  end

  def destroy
    if session.delete(:user_id)
      @current_user = nil #sessionのuse_id削除、メソッドcurrent_user=nillでログアウト状態を作る
      redirect_to root_path
      flash[:alert] = "ログアウトしました。"
    else
      redirect_to spots_path
      flash[:alert] = "ログアウト出来ませんでした。"
    end
  end

  private

  def session_params
    params.require(:session).permit(:name, :password, :user_id)
  end

end
