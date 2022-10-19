class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship_name)
    @ship = ship_name
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @ship != nil
      @fired_upon = true
      ship.hit
    else
      @fired_upon = true
    end
  end

  def render
    if self.empty? == true && self.fired_upon? == true
      return "M"
    elsif self.fired_upon? == false
      return "."
    else self.empty? == false && self.fired_upon? == true
      return "H"
    end
  end

end
