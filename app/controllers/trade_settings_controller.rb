class TradeSettingsController < GameAreaController
  actions :update
  
  def index
    @trade_partners = current_user.starship.trade_partners
  end
  
  def show
    @trade_settings = current_user.starship.trade_settings
  end
  
  def edit
    @trade_settings = current_user.starship.trade_settings
  end
  
  def update
    @trade_settings = current_user.starship.trade_settings
    update! do |format|
      format.html { redirect_to game_url }
    end
  end
end
