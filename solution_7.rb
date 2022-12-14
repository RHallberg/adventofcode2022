class Directory

  def initialize(parent = nil)
    @parent = parent
    @files = []
    @directories = {}
  end

  attr_reader  :files, :directories

  def parent
    @parent || self
  end
    

  def size
    return filesizes if directories.empty?
    directories.values.map(&:size).sum + filesizes
  end

  def add_file(str)
    files << str
  end

  def add_dir(str)
    @directories.merge! str => Directory.new(self)
  end

  def dir(str)
    @directories[str]
  end

  private

  def filesizes
    files.map{|f| f.match(/\d+/).to_s.to_i}.sum
  end

end




def solve(f)
  top_dir = Directory.new
  curr_dir = top_dir
  small_dirs = []
  File.readlines(f).each do |line|
    case line

    when /\$ cd \.\./
      size = curr_dir.size
      small_dirs << size if size <= 100000
      curr_dir = curr_dir.parent
    when /\$ cd/
      cd = line.match(/\w+$/).to_s
      curr_dir = curr_dir.dir(cd)
    when /dir /
      dir = line.match(/\w+$/).to_s
      curr_dir.add_dir(dir)
    when /\d+/
      curr_dir.add_file line
    else
      next
    end

  end
  small_dirs.sum

end

def total_used_space(f)
  top_dir = Directory.new
  curr_dir = top_dir
  File.readlines(f).each do |line|
    case line

    when /\$ cd \.\./
      size = curr_dir.size
      curr_dir = curr_dir.parent
    when /\$ cd/
      cd = line.match(/\w+$/).to_s
      curr_dir = curr_dir.dir(cd)
    when /dir /
      dir = line.match(/\w+$/).to_s
      curr_dir.add_dir(dir)
    when /\d+/
      curr_dir.add_file line
    else
      next
    end

  end
  top_dir.size

end


def solve_pt2(f)
  top_dir = Directory.new
  curr_dir = top_dir
  big_dirs = []
  File.readlines(f).each do |line|
    case line

    when /\$ cd \.\./
      size = curr_dir.size
      # 913445 calculated using a run where top_dir.size was returned
      big_dirs << size if size > 913445
      curr_dir = curr_dir.parent
    when /\$ cd/
      cd = line.match(/\w+$/).to_s
      curr_dir = curr_dir.dir(cd)
    when /dir /
      dir = line.match(/\w+$/).to_s
      curr_dir.add_dir(dir)
    when /\d+/
      curr_dir.add_file line
    else
      next
    end

  end
  big_dirs.min

end