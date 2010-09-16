class Point2D
  def unidimensional_distances_sum(x, y)
    (x - self.x).abs + (y - self.y).abs
  end
end
