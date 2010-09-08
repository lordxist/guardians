class UserSessionsController < InheritedResources::Base
  actions :create, :destroy
  
  create! do |success, failure|
    success.html { redirect_to game_url }
    failure.html { redirect_to root_url }
  end
  
  destroy! do |format|
    format.html { redirect_to root_url }
  end
end
