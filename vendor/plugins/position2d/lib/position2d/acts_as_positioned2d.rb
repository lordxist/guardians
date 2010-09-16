module Position2D
  module ActsAsPositioned2D
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      def acts_as_positioned2d
        scope :at_coords, lambda { |x_coord, y_coord|
          { :conditions => { :x_coord => x_coord, :y_coord => y_coord } }
        }
      end
    end
  end
end
