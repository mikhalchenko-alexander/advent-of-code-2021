input = File
        .readlines('input', chomp: true)

half_input_size = input.length / 2

one_bit_count = {}
one_bit_count.default = 0

input.each { |line| line.split('').each_with_index { |c, i| one_bit_count[i] += c.to_i } }

gamma = one_bit_count
        .sort_by { |entry| entry[0] }
        .map { |entry| entry[1] > half_input_size ? '1' : '0' }
        .join
        .to_i(2)

epsilon = gamma ^ 0xFFF

print(gamma * epsilon)
