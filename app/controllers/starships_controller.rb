class StarshipsController < InheritedResources::Base
  before_filter :require_user

  actions :update
  
  update! do |format|
    format.html { redirect_to :controller => "game" }
  end
end
