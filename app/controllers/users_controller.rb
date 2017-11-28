class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find(params[:id])
    if !logged_in?
      redirect '/destinations'
    end
    if !@user=="" && @user == current_user
      erb :'users/show'
    else
      redirect '/destinations'
    end
  end
end
