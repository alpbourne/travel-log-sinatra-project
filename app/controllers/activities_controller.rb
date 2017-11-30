class ActivitiesController < ApplicationController

  get "/activities" do
    redirect_if_not_logged_in
    @activities = current_user.activities
    erb :'activities/index'
  end

  post "/activities" do
    redirect_if_not_logged_in
    if params[:name].empty? || params[:description].empty?
      redirect "/activities/new?error=invalid activity"
    end
    @new_activity = Activity.create(:name => params[:name], :description => params[:description])
    current_user.activities << @new_activity
    redirect "/activities"
  end

  get "/activities/new" do
    redirect_if_not_logged_in
    @destinations = current_user.destinations
    @error = params[:error]
    erb :'/activities/new'
  end

  get "/activities/:id" do
    redirect_if_not_logged_in
    @activity = Activity.find(params[:id])
    if @activity.user_id == current_user.id
      erb :'activities/show'
    else
      erb :'destinations/index'
    end
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
    @destinations = current_user.destinations
    @error = params[:error]
    @activity = Activity.find(params[:id])
    erb :'activities/edit'
  end

  delete '/activities/:id/delete' do
    @activity = Activity.find(params[:id])
    if logged_in? && @activity.user_id == current_user.id
      @activity.destroy
      "Your Activity has been deleted."
      redirect '/activities'
    else
      redirect '/login'
    end
  end

end
