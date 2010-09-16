class Starsystem < Position2D::Base
  def name
    "(#{x_coord},#{y_coord})"
  end
end
