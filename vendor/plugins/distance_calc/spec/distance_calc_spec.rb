require 'distance_calc'

describe DistanceCalc do
  it "returns the unidimensional distances sum" do
    unidim_dist_sum(0, 0, 5, 5).should eql(10)
    unidim_dist_sum(10, 10, 5, 5).should eql(10)
    unidim_dist_sum(10, 30, 15, 5).should eql(30)
  end
end
