class SessionsController < ApplicationController
  def new
     @var = "Byeeeeeeeee"
  end

  def create
     zombie = Zombie.authenticate(params[:mail],params[:password])
     if (zombie) then
        session[:user_id] = zombie.id 
        @login = true
        redirect_to root_path
     else
        @login = false
     end
  end 
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
