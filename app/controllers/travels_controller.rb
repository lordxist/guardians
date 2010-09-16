class TravelsController < GameBaseController
  defaults :singleton => true
  actions :create, :show
end
