class PlanetsController < GameAreaController
  actions :none
  
  def show
    @planet = current_user.starship.planet_on_same_position
  end
end
