class UsersController < InheritedResources::Base
  actions :new, :create
  
  create!(:notice => "Registration successful!") do |format|
    format.html { render :action => "new" }
  end
end
