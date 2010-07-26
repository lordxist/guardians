class GameController < ApplicationController
  before_filter :require_user, :update_starships

  def index
  end
  
  private
  def update_starships
    Starship.all.each { |s| s.save }
  end
end
