class User < ActiveRecord::Base
  acts_as_authentic
  
  has_one :starship
  
  before_validation_on_create :add_starship
  
  private
  def add_starship
    self.starship = Starship.create
  end
end
