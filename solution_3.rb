def solve(f)
  input = File.read(f)

  value_array = ["_"] + ("a".."z").to_a + ("A".."Z").to_a

  input.split("\n").map do |bag|


    comps = bag.split("").each_slice(bag.length / 2).map(&:sort).map(&:uniq)
    dupe = comps.first.find{|item| comps.last.include?(item)}
    value_array.find_index{|val| val == dupe}
  end.sum
end

def solve_pt2(f)
  input = File.read(f)

  value_array = ["_"] + ("a".."z").to_a + ("A".."Z").to_a
  res = []

  input.split("\n").each_slice(3) do |group|
    bags = group.map{|bag| bag.split("")}.map(&:sort).map(&:uniq)

    dupe = bags[0].find{|item| bags[1].include?(item) && bags[2].include?(item)}
    puts dupe
    res << value_array.find_index{|val| val == dupe}
  end
  res.sum
end