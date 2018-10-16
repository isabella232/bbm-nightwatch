class PagesController < ApplicationController
  layout "landing", only: [:landing]

  def home
  end

  def landing
    @success_stories = SuccessStory.all
  end
end
