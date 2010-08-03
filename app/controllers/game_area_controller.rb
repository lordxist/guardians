class GameAreaController < InheritedResources::Base
  before_filter :require_user, :update_all_starships
  
  private
  def update_all_starships
    Starship.all.each {|s| s.save }
  end
end
