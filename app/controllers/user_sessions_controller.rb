class UserSessionsController < InheritedResources::Base
  actions :create, :destroy
  
  create! do |success, failure|
    success.html { redirect_to :controller => "game" }
    failure.html { redirect_to root_url }
  end
  
  destroy! do |format|
    format.html { redirect_to root_url }
  end
end
