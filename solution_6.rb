

def solve(f)

  input = File.read(f).split("")

  counter = 0
  input.each_with_index do |_, index|
    puts input[index..index+3].join
    return index+4 if input[index..index+3].uniq.count == 4
  end

end

def solve_pt2(f)

  input = File.read(f).split("")

  counter = 0
  input.each_with_index do |_, index|
    puts input[index..index+13].join
    return index+14 if input[index..index+13].uniq.count == 14
  end

end