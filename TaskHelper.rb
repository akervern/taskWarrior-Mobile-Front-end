class TaskSplitter
  TaskExec = "/usr/local/bin/task"
  @@userName = "arnaud"

  def list
    res = `#{TaskExec} long`.split("\n")
    @columns = splitHead(res[2])
    res
  end

  def detail(id)
    `#{TaskExec} info #{id}`.split("\n")
  end

  def splitHead(header)
    header.split.collect { |chars| chars.length }
  end

  def each_line(list_result)
    # Clean useless lines
    list = list_result.drop(3)
    list.pop(2)
    
    list.each do |line|
      line.chomp!
      next if line.empty?
      each_column(line) do |val|
        puts "column value : #{val}"
      end unless block_given?
      yield line if block_given?
    end
  end

  def each_column(line)
    prev = 0
    annotation = false
    @columns.each_with_index do |length, index|
      endStr = prev + length
      columnValue = line[prev..endStr].strip
      yield columnValue if block_given?
      annotation = annotation || (index == 0 && columnValue.empty?)
      prev = endStr + 1
    end
    annotation
  end
end

# Sample
a = TaskSplitter.new
list = a.list
# Loop over line results
a.each_line(list) do |line|
  puts "Line : #{line}"
  # Loop over column value
  isAnnotation = a.each_column(line) do |value|
    puts "Column : #{value}"
  end
  puts "Annotation !" if isAnnotation
end

nil
