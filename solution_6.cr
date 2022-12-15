

def solve(f)
  input = File.read(f).split("")
  input.each_with_index do |_, index|
    return index+4 if input[index..index+3].uniq.size == 4
  end
end

def solve_pt2(f)
  input = File.read(f).split("")
  input.each_with_index do |_, index|
    return index+14 if input[index..index+13].uniq.size == 14
  end
end


f = "input_6.txt"

t0 = Time.utc
solution = solve(f)
puts "Solved #1 #{solution} in: #{(Time.utc - t0).to_f}"

t0 = Time.utc
solution = solve_pt2(f)
puts "Solved #2 #{solution} in: #{(Time.utc - t0).to_f}"
