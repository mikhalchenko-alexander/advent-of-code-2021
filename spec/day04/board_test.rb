# frozen_string_literal: true

require 'minitest/autorun'
require './src/day04/board'

class BoardTest < Minitest::Test

  def setup
    @str = "1 2 3\n4 5 6\n7 8 9"
  end

  def teardown
    # Do nothing
  end

  def test_new_board_not_won
    board = Board.new(@str)
    assert_equal(false, board.won)
  end

  def test_mark_row_part_not_won
    board = Board.new(@str)
    board.mark(4)
    board.mark(6)
    assert_equal(false, board.won)
  end

  def test_mark_row_full_won
    board = Board.new(@str)
    board.mark(4)
    board.mark(5)
    board.mark(6)
    assert_equal(true, board.won)
  end

  def test_mark_column_part_not_won
    board = Board.new(@str)
    board.mark(2)
    board.mark(8)
    assert_equal(false, board.won)
  end

  def test_mark_column_full_won
    board = Board.new(@str)
    board.mark(2)
    board.mark(5)
    board.mark(8)
    assert_equal(true, board.won)
  end

  def test_score
    board = Board.new(@str)
    board.mark(2)
    board.mark(5)
    board.mark(8)
    assert_equal(240, board.score)
  end
end
