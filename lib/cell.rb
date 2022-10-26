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

  def render(value = false)
    if value == true
      if self.empty? && self.fired_upon?
        return "M"
      elsif !self.empty? && self.fired_upon? && ship.sunk?
        return "X"
      elsif !self.empty? && self.fired_upon?
        return "H"
      elsif !self.empty? && !self.fired_upon?
        return "S"
      else !self.fired_upon?
        return "."
      end
    else
      if self.empty? && self.fired_upon?
        return "M"
      elsif !self.empty? && self.fired_upon? && ship.sunk?
        return "X"
      elsif !self.empty? && self.fired_upon?
        return "H"
      else !self.fired_upon?
        return "."
      end
    end
  end
end
