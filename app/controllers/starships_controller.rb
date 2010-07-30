class StarshipsController < GameAreaController
  actions :update
  
  update! do |format|
    format.html { redirect_to :controller => "game" }
  end
end
