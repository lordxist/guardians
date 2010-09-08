class User < ActiveRecord::Base
  acts_as_authentic
  
  has_one :starship
  
  validates_presence_of :starship
end
