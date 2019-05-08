class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    github = GithubService.new
    session[:token] = github.authenticate!(ENV['FOURSQUARE_CLIENT_ID'], ENV['FOURSQUARE_SECRET'], params[:code])
    session[:username] = github.get_username
    redirect_to root_path
  end
end
