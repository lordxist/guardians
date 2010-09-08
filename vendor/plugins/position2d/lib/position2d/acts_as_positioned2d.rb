module Position2D
  module ActsAsPositioned2D
    def self.included(base)
      base.class_eval do
        extend ClassMethods
        
        def self.inherited_with_acts_as_positioned2d_hook(klass)
          inherited_without_acts_as_positioned2d_hook(klass)
          klass.acts_as_positioned2d
        end
        class << self
          alias_method_chain :inherited, :acts_as_positioned2d_hook
        end
      end
    end
    
    module ClassMethods
      def acts_as_positioned2d
        named_scope :at, lambda { |x_pos, y_pos|
          { :conditions => { :x_pos => x_pos, :y_pos => y_pos } }
        }
      end
    end
  end
end
