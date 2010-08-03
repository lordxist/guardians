def should_update_all_starships_before(action)
  Factory(:starship)
  Starship.any_instance.expects(:save).at_least_once
  if ["create", "update", "destroy"].include?(action)
    post action
  else
    get action
  end
end
