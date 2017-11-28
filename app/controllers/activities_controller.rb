class ActivitiesController < ApplicationController

  get "/activities" do
    redirect_if_not_logged_in
    @activities = Activity.all
    erb :'activities/index'
  end

  post "/activities" do
    redirect_if_not_logged_in
    unless Activity.valid_params?(params)
      redirect "/activities/new?error=invalid activity"
    end
    Activity.create(params)
    redirect "/activities"
  end

  get "/activities/new" do
    redirect_if_not_logged_in
    @error = params[:error]
    erb :'/activities/new'
  end

end
