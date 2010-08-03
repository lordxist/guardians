def stub_starship
  Starship.stubs(:find).returns(Factory(:starship))
end
