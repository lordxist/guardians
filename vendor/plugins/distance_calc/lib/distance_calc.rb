module DistanceCalc
  def self.unidim_dist_sum(x1, y1, x2, y2)
    (x2 - x1).abs + (y2 - y1).abs
  end
end
