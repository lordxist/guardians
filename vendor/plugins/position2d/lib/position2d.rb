require 'position2d/acts_as_positioned2d'

if defined?(ActiveRecord)
  ActiveRecord::Base.class_eval do
    include Position2D::ActsAsPositioned2D
  end
end

module Position2D
  class Base
    def self.at(x_coord, y_coord)
      @position ||= {}
      @position[:x_coord => x_coord,
                :y_coord => y_coord] ||= new(x_coord, y_coord)
    end
    
    private_class_method :new
    
    attr_reader :x_coord, :y_coord
    
    def initialize(x_coord, y_coord)
      @x_coord = x_coord
      @y_coord = y_coord
    end
    
    def respond_to?(method_symbol, include_private = false)
      true
    end
    
    private
    def method_missing(method_symbol, *args)
      singular_name = method_symbol.to_s.singularize
      list = singular_name.camelize.constantize.at(x_coord, y_coord)
      return list unless singular_name.eql?(method_symbol.to_s)
      list[0]
    end
  end
end
