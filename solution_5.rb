

# [N]         [C]     [Z]            
# [Q] [G]     [V]     [S]         [V]
# [L] [C]     [M]     [T]     [W] [L]
# [S] [H]     [L]     [C] [D] [H] [S]
# [C] [V] [F] [D]     [D] [B] [Q] [F]
# [Z] [T] [Z] [T] [C] [J] [G] [S] [Q]
# [P] [P] [C] [W] [W] [F] [W] [J] [C]
# [T] [L] [D] [G] [P] [P] [V] [N] [R]
#  1   2   3   4   5   6   7   8   9 




class CargoStacks

  def initialize(stacks)
    @stacks = stacks
  end

  def move(from, to)
    @stacks[to].push @stacks[from].pop unless @stacks[from].count == 0
  end

  def move_pt2(nbr, from, to)
    tmp =  []
    nbr.times{tmp << @stacks[from].pop}

    @stacks[to].push tmp.reverse
    @stacks[to].flatten!
  end

  def top_boxes
    @stacks.map(&:last).join
  end


end


def solve(f)

  initial_stacks = [
    [],
    ["T", "P", "Z", "C", "S", "L", "Q", "N"],
    ["L", "P", "T", "V", "H", "C", "G"],
    ["D", "C", "Z", "F"],
    ["G", "W", "T", "D", "L", "M", "V", "C"],
    ["P", "W", "C"],
    ["P", "F", "J", "D", "C", "T", "S", "Z"],
    ["V", "W", "G", "B", "D"],
    ["N", "J", "S", "Q", "H", "W"],
    ["R", "C", "Q", "F", "S", "L", "V"]
  ]

  input = File.read(f)

  thestacks = CargoStacks.new(initial_stacks)

  
  input.split("\n").each do |row|
    is = row.scan(/\d+/)
    is[0].to_i.times do 
      thestacks.move(is[1].to_i, is[2].to_i)
    end

  end

  thestacks.top_boxes

end


def solve_pt2(f)

  initial_stacks = [
    [],
    ["T", "P", "Z", "C", "S", "L", "Q", "N"],
    ["L", "P", "T", "V", "H", "C", "G"],
    ["D", "C", "Z", "F"],
    ["G", "W", "T", "D", "L", "M", "V", "C"],
    ["P", "W", "C"],
    ["P", "F", "J", "D", "C", "T", "S", "Z"],
    ["V", "W", "G", "B", "D"],
    ["N", "J", "S", "Q", "H", "W"],
    ["R", "C", "Q", "F", "S", "L", "V"]
  ]

  input = File.read(f)

  thestacks = CargoStacks.new(initial_stacks)

  
  input.split("\n").each do |row|
    is = row.scan(/\d+/)
    thestacks.move_pt2(is[0].to_i, is[1].to_i, is[2].to_i)
  end

  thestacks.top_boxes

end
