class StarshipsController < GameAreaController
  actions :update
  
  def update
    @starship = current_user.starship
    update! do |format|
      format.html { redirect_to :controller => "game" }
    end
  end
end
