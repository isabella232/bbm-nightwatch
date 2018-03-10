class PagesController < ApplicationController
  layout "landing", only: [:landing]

  def home
  end

  def landing
  end
end
