# frozen_string_literal: true

input = File.readlines('input', chomp: true)
number_input = input.map(&:to_i)
res = 0
number_input.each_with_index do |num, i|
  res += 1 if i > 0 && num > number_input[i - 1]
end

print res
