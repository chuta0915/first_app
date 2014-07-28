# encoding: utf-8
class SessionsController < ApplicationController

  # GET /signin <~ signin_path
  def new
  end

  def create
    # $B0J2<$G2hLL$rJV$7$F%Q%i%a!<%?3NG'$r<B9T(B
    #render 'new'

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # $B%5%$%s%$%s8e!"%f!<%6%Z!<%8$X%j%@%$%l%/%H(B
      sign_in user
      redirect_back_or user
    else
      # $B%(%i!<%a%C%;!<%8$rI=<($7!"%5%$%s%$%s%U%)!<%`$r:FI=<($9$k(B
      flash.now[:error] = 'E-mail$B$H%Q%9%o!<%I$,4V0c$C$F$$$^$9(B'
      render 'new'
    end
  end

  # DELETE /signout <~ signout_path
  def destroy
    sign_out
    redirect_to root_url
  end
end
