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
  
  def render(value=false)
    if self.empty? == true && self.fired_upon? == true
      return "M"
    elsif value == true && self.empty? == false
      return "S"
    elsif self.fired_upon? == false
      return "."
    elsif self.empty? == false && self.fired_upon? == true && ship.sunk? == true
      return "X"
    elsif self.empty? == false && self.fired_upon? == true
      return "H"
    end
  end
end