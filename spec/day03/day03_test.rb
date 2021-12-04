require './src/day03/main'
require 'minitest/autorun'

class Day03Test < Minitest::Test
  def setup
    @input = [
      %w[0 0 1 0 0],
      %w[1 1 1 1 0],
      %w[1 0 1 1 0],
      %w[1 0 1 1 1],
      %w[1 0 1 0 1],
      %w[0 1 1 1 1],
      %w[0 0 1 1 1],
      %w[1 1 1 0 0],
      %w[1 0 0 0 0],
      %w[1 1 0 0 1],
      %w[0 0 0 1 0],
      %w[0 1 0 1 0]
    ]
  end

  def teardown
    # Do nothing
  end

  def test_filter_most_common_bits
    assert_equal %w[1 0 1 1 1], filter_most_common_bits(@input)
  end

  def test_filter_least_common_bits
    assert_equal %w[0 1 0 1 0], filter_least_common_bits(@input)
  end

  def test_least_common_bit
    assert_equal '0', least_common_bit(@input, 0)
    assert_equal '1', least_common_bit(@input, 1)
    assert_equal '0', least_common_bit(@input, 2)
    assert_equal '0', least_common_bit(@input, 3)
    assert_equal '1', least_common_bit(@input, 4)
  end

  def test_most_common_bit
    assert_equal '1', most_common_bit(@input, 0)
    assert_equal '0', most_common_bit(@input, 1)
    assert_equal '1', most_common_bit(@input, 2)
    assert_equal '1', most_common_bit(@input, 3)
    assert_equal '0', most_common_bit(@input, 4)
  end

  def test_most_common_bit_for_odd_length
    input = [
      %w[1 1 1 1 0],
      %w[1 0 1 1 0],
      %w[1 0 1 1 1],
      %w[1 0 1 0 1],
      %w[1 1 1 0 0],
      %w[1 0 0 0 0],
      %w[1 1 0 0 1]
    ]
    assert_equal '0', most_common_bit(input, 1)
  end

  def test_filter
    expected = [
      %w[1 1 1 1 0],
      %w[1 0 1 1 0],
      %w[1 0 1 1 1],
      %w[1 0 1 0 1],
      %w[1 1 1 0 0],
      %w[1 0 0 0 0],
      %w[1 1 0 0 1]
    ]
    assert_equal expected, filter(@input, 0, '1')
  end
end
