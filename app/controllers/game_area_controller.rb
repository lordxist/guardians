class GameAreaController < InheritedResources::Base
  before_filter :require_user
  
  
end
