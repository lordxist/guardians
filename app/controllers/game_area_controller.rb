class GameAreaController < InheritedResources::Base
  before_filter :require_user, :update_related_game_objects
  
  helper_method :current_starship
  
  protected
  def begin_of_association_chain
    current_starship
  end
  
  def current_starship
    current_user.starship
  end
  
  private
  def update_related_game_objects
    current_starship.update_related_game_objects
  end
end
