input = File
        .readlines('input', chomp: true)

horizontal = 0
depth = 0
aim = 0

input.each do |line|
  command = line.split(' ')
  value = command[1].to_i
  case command[0]
  when 'forward'
    horizontal += value
    depth += aim * value
  when 'down'
    aim += value
  else # up
    aim -= value
  end
end

print(horizontal * depth)
