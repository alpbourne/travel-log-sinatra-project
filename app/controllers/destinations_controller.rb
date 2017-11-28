class DestinationsController < ApplicationController

  get "/destinations" do
    redirect_if_not_logged_in
    @destinations = Destination.all
    erb :'destinations/index'
  end

  post "/destinations" do
    redirect_if_not_logged_in
    unless Destination.valid_params?(params)
      redirect "/destinations/new?error=invalid destination"
    end
    Destination.create(params)
    redirect "/destinations"
  end

  get "/destinations/new" do
    redirect_if_not_logged_in
    @error = params[:error]
    erb :'/destinations/new'
  end

  get "/destinations/:id" do
    redirect_if_not_logged_in
    @destination = Destination.find(params[:id])
    erb :'destinations/show'
  end

  post "/destinations/:id" do
    redirect_if_not_logged_in
    @destination = Destination.find(params[:id])
    unless Destination.valid_params?(params)
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

end
