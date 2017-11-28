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


end
