class UserSessionsController < InheritedResources::Base
  actions :create, :destroy

  def create
    create! do |format|
      format.html { redirect_to game_url }
    end
  end

  def destroy
    destroy! do |success, failure|
      success.html { redirect_to root_url }
    end
  end
end
