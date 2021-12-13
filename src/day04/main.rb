# frozen_string_literal: true

require './board'

if __FILE__ == $PROGRAM_NAME
  input = File.read('input', chomp: true)
  input_parts = input.split("\n\n")
  numbers = input_parts[0].split(',').map(&:to_i)

  boards = input_parts.drop(1).map { |board_str| Board.new(board_str) }
  numbers.each do |number|
    boards.each { |board| board.mark(number) }
    boards = boards.filter { !_1.won } if boards.length > 1
    break unless boards.length > 1 || !boards[0].won
  end

  puts boards[0].score
end
