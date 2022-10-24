# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

# Some documentation
class TestGoldenRatio < Minitest::Test
  def test_ratio
    assert_in_epsilon(1.618, golden_ratio, 1e-3)
    assert_in_epsilon(1.618, golden_ratio(1e-4), 1e-4)
  end
end
