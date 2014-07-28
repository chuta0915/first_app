# encoding: utf-8
class SessionsController < ApplicationController

  # GET /signin <~ signin_path
  def new
  end

  def create
    # 以下で画面を返してパラメータ確認を実行
    #render 'new'

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # サインイン後、ユーザページへリダイレクト
      sign_in user
      redirect_back_or user
    else
      # エラーメッセージを表示し、サインインフォームを再表示する
      flash.now[:error] = 'E-mailとパスワードが間違っています'
      render 'new'
    end
  end

  # DELETE /signout <~ signout_path
  def destroy
    sign_out
    redirect_to root_url
  end
end
