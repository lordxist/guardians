def should_update_related_game_objects_before(action)
  current_user = UserSession.find.record
  UserSession.any_instance.stubs(:record).returns(current_user)
  starship = current_user.starship
  current_user.stubs(:starship).returns(starship)
  current_user.starship.expects(:update_related_game_objects)
  if ["create", "update", "destroy"].include?(action)
    post action
  else
    get action
  end
end
