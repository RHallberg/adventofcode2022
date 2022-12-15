

def solve(f)
  File.read(f).split("").each_with_index do |_, index|
    return index+4 if input[index..index+3].uniq.count == 4
  end
end

def solve_pt2(f)
  File.read(f).split("").each_with_index do |_, index|
    return index+14 if input[index..index+13].uniq.count == 14
  end
end