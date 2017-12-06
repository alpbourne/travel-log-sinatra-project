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
      @error = params[:error]
      erb :'users/register'
    else
      redirect to '/destinations'
    end
  end

  post '/register' do
    if params[:user][:password] == "" || params[:user][:username] == "" || User.find_by(username: params[:user][:username])
      redirect "/register?error=Unsuccessful Registration - username is taken and/or a field was left empty."
    else
      @user = User.new(params[:user])
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
