class GameBaseController < InheritedResources::Base
  before_filter :require_user, :update_game_objects
  
  layout 'game'
    
  helper_method :current_starship

  protected
  def begin_of_association_chain
    current_starship
  end

  def current_starship
    current_user.starship
  end

  private
  def update_game_objects
    Starship.all.each {|s| s.save }
  end
end
