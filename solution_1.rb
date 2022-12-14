
def solve(file: )
  res = File.read(file)

  res.split("\n\n").map do |elf|
    elf.split("\n").map(&:to_i).sum
  end.max

end

def solve_pt2(file: )
  res = File.read(file)

  sorted = res.split("\n\n").map{ |elf| elf.split("\n").map(&:to_i).sum}.sort
  sorted[-3..-1].sum

end

