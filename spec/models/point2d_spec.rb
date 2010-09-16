require 'spec_helper'

describe Point2D do
  it "returns the unidimensional distances sum to a pair of coordinates" do
    Point2D.new(0, 0).unidimensional_distances_sum(5, 5).should eql(10)
    Point2D.new(10, 10).unidimensional_distances_sum(5, 5).should eql(10)
    Point2D.new(10, 30).unidimensional_distances_sum(15, 5).should eql(30)
  end
end
