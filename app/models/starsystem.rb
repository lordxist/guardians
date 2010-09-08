class Starsystem < Position2D::Base
  def name
    name = ""
    name += planet.name + "(" if planet
    name += "#{x_coord},#{y_coord}"
    name += ")" if planet
    name
  end
end
