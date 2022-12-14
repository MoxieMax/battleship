
class Board
  attr_reader :cells

  def initialize
    @cells = {
      'A1' => Cell.new('A1'),
      'A2' => Cell.new('A2'),
      'A3' => Cell.new('A3'),
      'A4' => Cell.new('A4'),
      'B1' => Cell.new('B1'),
      'B2' => Cell.new('B2'),
      'B3' => Cell.new('B3'),
      'B4' => Cell.new('B4'),
      'C1' => Cell.new('C1'),
      'C2' => Cell.new('C2'),
      'C3' => Cell.new('C3'),
      'C4' => Cell.new('C4'),
      'D1' => Cell.new('D1'),
      'D2' => Cell.new('D2'),
      'D3' => Cell.new('D3'),
      'D4' => Cell.new('D4'),
    }
  end

  def valid_coordinate?(coords)
    @cells.keys.include?(coords)
  end
  
  def valid_length?(ship, coords)
    ship.length == coords.length
  end
  
  def horizontal_placement?(ship, coords)
    coords.sort!
    letter = coords.map { |coord| coord.slice(0) }
    num = coords.map { |coord| coord.slice(1..2).to_i }
    (letter.uniq.count == 1 && (num.min..num.max).to_a == num)
  end
  
  def vertical_placement?(ship, coords)
    coords.sort!
    letter = coords.map { |coord| coord.slice(0) }
    num = coords.map { |coord| coord.slice(1..2).to_i }
    (num.all?(num[0]) && (letter[0].ord + (ship.length - 1)) == letter.last.ord)
  end
  
  def cell_empty?(coords)
      coords.count {|coord| valid_coordinate?(coord) && @cells[coord].empty?} == coords.length
  end
  
  def valid_placement?(ship, coords)
    coords.sort!
    if valid_length?(ship, coords) && horizontal_placement?(ship, coords) && cell_empty?(coords) || valid_length?(ship, coords) && vertical_placement?(ship, coords) && cell_empty?(coords)
      true
    else
      false
    end
  end
  
  def place(ship, coords)
    if coords.map { |coord| valid_coordinate?(coord) } && valid_placement?(ship, coords)
      coords.map { |coord| @cells[coord].place_ship(ship) }
      true
    else
      false
    end
  end
  
  def render(is = false)
    cell_rend = @cells.values.map do |value|
      value.render(is)
    end
    "  1 2 3 4 \n" +
    "A #{cell_rend[0]} #{cell_rend[1]} #{cell_rend[2]} #{cell_rend[3]} \n" +
    "B #{cell_rend[4]} #{cell_rend[5]} #{cell_rend[6]} #{cell_rend[7]} \n" +
    "C #{cell_rend[8]} #{cell_rend[9]} #{cell_rend[10]} #{cell_rend[11]} \n" +
    "D #{cell_rend[12]} #{cell_rend[13]} #{cell_rend[14]} #{cell_rend[15]} \n"
  end
end