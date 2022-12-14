

def solve(f)

  input = File.read(f)
  ranges = []
  input.split("\n").map do |pair|
    ranges = pair.split(",").map{|task| task.split("-").map(&:to_i) }
    (ranges[1][0] >= ranges[0][0] && ranges[1][1] <= ranges[0][1]) || (ranges[0][0] >= ranges[1][0] && ranges[0][1] <= ranges[1][1])  ? 1 : 0
  end.sum

end

def solve_pt2(f)

  input = File.read(f)
 
  ranges = []
  input.split("\n").map do |pair|
    ranges = pair.split(",").map{|task| task.split("-").map(&:to_i) }
    puts ranges
    (ranges[0][0] <= ranges[1][1] && ranges[0][1] >= ranges[1][0]) ? 1 : 0
    
  end.sum

end