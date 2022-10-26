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
  
  def render(value = false) #terminology: default argument
    if self.empty? && self.fired_upon?
      return "M"
    elsif value == true && !self.empty?
      return "S"
    elsif !self.empty? && self.fired_upon? && ship.sunk?
      return "X"
    elsif !self.empty? && self.fired_upon?
      return "H"
    else !self.fired_upon?
      return "."
    end
  end
end