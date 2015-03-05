class RepositoriesController < ApplicationController

  def index
  end

  def show
    @profile = Profile.find_by_username(params[:username])
    if @profile.blank? || @profile.updated_at < Time.now - 1.day
      @profile = Profile.create_or_update_username(params[:username], @profile)
    end
    @repositories = RepositoryList.new(params[:username]).repositories
  end

end
