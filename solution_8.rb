


def visible?(iy, ix, h, grid)
  if grid[iy-1..iy+1][ix-1].nil?
    puts "What the fuck #{iy},#{ix} #{grid[iy-1..iy+1].inspect} "
  end
  grid[iy-1..iy+1][ix-1].reduce(true){|acc, v| acc && v < h} &&
  grid[iy-1..iy+1][ix+1].reduce(true){|acc, v| acc && v < h} &&
  (grid[iy][ix-1] < h && grid[iy][ix+1] < h)
end


def solve(f)
  input = File.read(f)
  visible_count = 0
  full_grid = input.split("\n").map{|col| col.split("").map(&:to_i)}
  check_grid = full_grid[1..-2].map{|col| col[1..-2]}
  check_grid.each_with_index do |col, iy|
    col.each_with_index do |row, ix|
      visible_count += 1 if visible?(iy+1, ix+1, row, full_grid)
    end
  end
end