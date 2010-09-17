class User < ActiveRecord::Base
  acts_as_authentic

  has_one :starship

  before_create :build_starship

  alias_method :build_starship_without_name, :build_starship
  def build_starship(options = {})
    options.merge!(:name => username)
    build_starship_without_name(options)
  end
end
