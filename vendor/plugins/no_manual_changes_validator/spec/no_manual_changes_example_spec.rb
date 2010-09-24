require 'active_model'
require 'no_manual_changes_validator'

class NoManualChangesExample
  include ActiveModel::Validations
  include ActiveModel::Dirty

  attr_reader :a, :b
  
  define_attribute_methods [:a, :b]

  validates :a, :b, :no_manual_changes => true

  def initialize(a, b)
    @a, @b = a, b
  end
  
  def a=(val)
    a_will_change! unless val == @a
    @a = val
  end
  
  def b=(val)
    b_will_change! unless val == @b
    @b = val
  end
end

describe NoManualChangesExample do
  before(:each) do
    @no_manual_changes_example = NoManualChangesExample.new(0, 1)
  end

  it "a can not be changed manually" do
    @no_manual_changes_example.a = 2
    @no_manual_changes_example.valid?.should be_false
  end

  it "b can not be changed manually" do
    @no_manual_changes_example.b = 5
    @no_manual_changes_example.valid?.should be_false
  end
end
