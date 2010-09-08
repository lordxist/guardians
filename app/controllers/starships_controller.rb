class StarshipsController < GameAreaController
  defaults :singleton => true
  actions :update
    
  helper_method :current_starship
  
  update! do |format|
    format.html { redirect_to game_url }
  end
  
  protected  
  def resource
    current_starship
  end
end
