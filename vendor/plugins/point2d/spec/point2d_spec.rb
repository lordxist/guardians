require 'point2d'

describe Point2D do
  before do
    @point2d = Point2D.new(5, 2)
  end

  it "has an x" do
    @point2d.x.should eql(5)
  end

  it "has an y" do
    @point2d.y.should eql(2)
  end
end
