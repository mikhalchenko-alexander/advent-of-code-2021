# frozen_string_literal: true

require './board'

if __FILE__ == $PROGRAM_NAME
  input = File.read('input', chomp: true)
  input_parts = input.split("\n\n")
  numbers = input_parts[0].split(',').map(&:to_i)

  boards = input_parts.drop(1).map { |board_str| Board.new(board_str) }
  found = nil
  numbers.each do |number|
    boards.each { |board| board.mark(number) }
    found = boards.find(&:won)
    break unless found.nil?
  end

  puts found.score
end
