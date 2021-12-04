# frozen_string_literal: true

def most_common_bit(numbers, index)
  half_numbers_size = numbers.length / 2
  one_count = numbers.map { |n| n[index] }
                     .count { |n| n == '1' }
  one_count > half_numbers_size ? '1' : '0'
end

input = File
        .readlines('input', chomp: true)
        .map { |line| line.split('') }

gamma = (0..input[0].length - 1)
        .map { |i| most_common_bit(input, i) }
        .join
        .to_i(2)

epsilon = gamma ^ 0xFFF

print(gamma * epsilon)
