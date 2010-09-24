# necessary because factory girl doesn't handle my
# NoManualChangesValidator plugin well
class Factory::Proxy::CreateWithoutValidation < Factory::Proxy::Build
  def result
    @instance.save(:validate => false)
    @instance
  end
end

class Factory
  def self.create_without_validation (name, overrides = {})
    factory_by_name(name).run(Proxy::CreateWithoutValidation, overrides)
  end
end

Factory.define :starship, :default_strategy => :create_without_validation do |s|
  s.x_coord 0
  s.y_coord 0
end
