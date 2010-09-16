class User < ActiveRecord::Base
  acts_as_authentic

  has_one :starship

  before_create :build_starship
end
