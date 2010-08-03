def stub_starship
  Starship.stubs(:find).returns(Factory(:starship))
end

def always_at_least_zero(field)
  starship = Factory(:starship)
  starship[field] = nil
  starship.should_not be_valid
  starship[field] = -1
  starship.should_not be_valid
end

def always_greater_than_zero(field)
  always_at_least_zero(field)
  starship = Factory(:starship)
  starship[field] = 0
  starship.should_not be_valid
end
