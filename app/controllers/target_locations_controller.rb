class TargetLocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @target_locations = TargetLocation.all
  end

end