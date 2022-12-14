def solve(f)

  # A rock 1, B paper 2, C scissors 3
  # X rock 1, Y paper 2, z scissors 3

  input = File.read(f)

  score_map = {
    "A X" => 1+3,
    "A Y" => 2+6,
    "A Z" => 3+0,
    "B X" => 1+0,
    "B Y" => 2+3,
    "B Z" => 3+6,
    "C X" => 1+6,
    "C Y" => 2+0,
    "C Z" => 3+3
  }

  input.split("\n").map{|game| score_map[game] }.sum
  
end

def solve_pt2(f)

  # A rock 1, B paper 2, C scissors 3
  # X rock 1, Y paper 2, z scissors 3

  input = File.read(f)

  score_map = {
    "A X" => 0+3,
    "A Y" => 3+1,
    "A Z" => 6+2,
    "B X" => 0+1,
    "B Y" => 3+2,
    "B Z" => 6+3,
    "C X" => 0+2,
    "C Y" => 3+3,
    "C Z" => 6+1
  }

  input.split("\n").map{|game| score_map[game] }.sum
  
end