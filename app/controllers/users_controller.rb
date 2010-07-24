class UsersController < InheritedResources::Base
  actions :new, :create
  
  create! do |success, failure|
    success.html { redirect_to new_user_url(:successful => true) }
  end
end
