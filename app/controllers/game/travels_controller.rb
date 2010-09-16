module Game
  class TravelsController < BaseController
    defaults :singleton => true
    actions :create, :show
  end
end
