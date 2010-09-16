class GameBaseController < InheritedResources::Base
  before_filter :require_user
  
  layout 'game'
    
  helper_method :current_starship

  protected
  def begin_of_association_chain
    current_starship
  end

  def current_starship
    current_user.starship
  end
end
