def always_at_least_zero(model, field)
  obj = Factory(model.to_sym)
  obj[field] = nil
  obj.should_not be_valid
  obj[field] = -1
  obj.should_not be_valid
end

def always_greater_than_zero(model, field)
  always_at_least_zero(model, field)
  obj = Factory(model.to_sym)
  obj[field] = 0
  obj.should_not be_valid
end
