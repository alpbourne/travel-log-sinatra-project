class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find(params[:id])
    if !logged_in?
      redirect '/destinations'
    end
    if !@user== "" && @user == current_user
      erb :'users/show'
    else
      redirect '/destinations'
    end
  end

  get '/register' do
    if !logged_in?
      erb :'users/register'
    else
      redirect to '/destinations'
    end
  end

  post '/register' do
    if params[:password] == "" || params[:username] == ""
      redirect to "/register"
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect '/destinations'
      else
        erb :'/register'
      end
    end
  end

  get '/login' do
    @error_message = params[:error]
    if !logged_in?
      erb :'users/login'
    else
      redirect '/destinations'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/destinations'
    else
      redirect to '/register'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
