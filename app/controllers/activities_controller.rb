class ActivitiesController < ApplicationController

  get "/activities" do
    redirect_if_not_logged_in
    @activities = Activity.all
    erb :'activities/index'
  end

  post "/activities" do
    redirect_if_not_logged_in
    if params[:name].empty? || params[:description].empty?
      redirect "/activities/new?error=invalid activity"
    end
    Activity.create(:name => params[:name], :description => params[:description])
    redirect "/activities"
  end

  get "/activities/new" do
    redirect_if_not_logged_in
    @error = params[:error]
    erb :'/activities/new'
  end

  get "/activities/:id" do
    redirect_if_not_logged_in
    @activity = Activity.find(params[:id])
    erb :'activities/show'
  end

  post "/activities/:id" do
    redirect_if_not_logged_in
    @activity = Activity.find(params[:id])
    if params[:name].empty? || params[:description].empty?
      redirect "/activities/#{@activity.id}/edit?error=invalid activity"
    end
    @activity.update(params.select{|a| a=="name" || a=="description" || a=="destination_id"})
    redirect "/activities/#{@activity.id}"
  end

  get "/activities/:id/edit" do
    redirect_if_not_logged_in
    @error = params[:error]
    @activity = Activity.find(params[:id])
    erb :'activities/edit'
  end

end
