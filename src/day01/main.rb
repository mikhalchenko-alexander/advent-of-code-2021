# frozen_string_literal: true

triplet_sums = File
               .readlines('input', chomp: true)
               .map(&:to_i)
               .each_cons(3)
               .map(&:sum)
res = 0
triplet_sums.each_with_index do |num, i|
  res += 1 if i > 0 && num > triplet_sums[i - 1]
end

print res
