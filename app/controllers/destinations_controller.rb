class DestinationsController < ApplicationController

  get "/destinations" do
    redirect_if_not_logged_in
    @destinations = current_user.destinations
    erb :'destinations/index'
  end

  post "/destinations" do
    redirect_if_not_logged_in
    if params[:name].empty?
      redirect "/destinations/new?error=invalid destination"
    else
      @new_destination = Destination.create(params)
      current_user.destinations << @new_destination
      redirect "/destinations"
    end
  end

  get "/destinations/new" do
    redirect_if_not_logged_in
    @error = params[:error]
    erb :'/destinations/new'
  end

  get "/destinations/:id" do
    redirect_if_not_logged_in
    @destination = Destination.find(params[:id])
    if @destination.user_id == current_user.id
     erb :'destinations/show'
    else
      erb :'destinations/index'
    end
  end

  post "/destinations/:id" do
    redirect_if_not_logged_in
    @destination = Destination.find(params[:id])
    if params[:name].empty?
      redirect "/destinations/#{@destination.id}/edit?error=invalid destination"
    end
    @destination.update(name: params[:name])
    redirect "/destinations/#{@destination.id}"
  end

  get "/destinations/:id/edit" do
    redirect_if_not_logged_in
    @error = params[:error]
    @destination = Destination.find(params[:id])
    erb :'destinations/edit'
  end

  delete '/destinations/:id/delete' do
    @destination = Destination.find(params[:id])
    if logged_in? && @destination.user_id == current_user.id
      @destination.destroy
      "Your destination has been deleted."
      redirect '/destinations'
    else
      redirect '/login'
    end
  end
end
