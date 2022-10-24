# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

# Some documentation
class TestGoldenRatio < Minitest::Test
  def test_ratio
    fib = FibonacciSequence.new
    assert_in_epsilon(1.618, calculate_golden_ratio(fib), 1e-3)
    assert_in_epsilon(1.618, calculate_golden_ratio(fib, 1e-4), 1e-4)
  end
end
