class DestinationsController < ApplicationController

  get "/destinations" do
    redirect_if_not_logged_in
    @destinations = Destination.all
    erb :'destinations/index'
  end

  
end
