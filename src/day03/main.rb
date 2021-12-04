# frozen_string_literal: true

def most_common_bit(numbers, index)
  half_numbers_size = numbers.length / 2 + numbers.length % 2
  one_count = numbers.map { |n| n[index] }
                     .count { |n| n == '1' }
  one_count >= half_numbers_size ? '1' : '0'
end

def least_common_bit(numbers, index)
  half_numbers_size = numbers.length / 2 + numbers.length % 2
  one_count = numbers.map { |n| n[index] }
                     .count { |n| n == '1' }
  one_count >= half_numbers_size ? '0' : '1'
end

def filter(numbers, index, bit)
  numbers.filter { |n| n[index] == bit }
end

def filter_most_common_bits(numbers, index = 0)
  if numbers.length == 1
    numbers[0]
  else
    most_common_bit = most_common_bit(numbers, index)
    filtered = filter(numbers, index, most_common_bit)
    filter_most_common_bits(filtered, index + 1)
  end
end

def filter_least_common_bits(numbers, index = 0)
  if numbers.length == 1
    numbers[0]
  else
    least_common_bit = least_common_bit(numbers, index)
    filtered = filter(numbers, index, least_common_bit)
    filter_least_common_bits(filtered, index + 1)
  end
end

def load_input
  File
    .readlines('input', chomp: true)
    .map { |line| line.split('') }
end

def calculate_gamma(input)
  (0..input[0].length - 1)
    .map { |i| most_common_bit(input, i) }
    .join
    .to_i(2)
end

if __FILE__ == $0
  input = load_input
  gamma = calculate_gamma(input)
  epsilon = gamma ^ 0xFFF
  print("Gamma * Epsilon: #{gamma * epsilon}\n")

  oxygen = filter_most_common_bits(input).join.to_i(2)
  co2 = filter_least_common_bits(input).join.to_i(2)
  print("Oxygen * CO2: #{oxygen * co2}\n")
end

