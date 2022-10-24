# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

# Some description of testing class
class TestIntegral < Minitest::Test
  def test_correctness_block
    assert_equal(trap(0, 1) { 1 }, 1)
    assert_equal(trap(-0.5, -1.5) { 1 }, -1)
    assert_equal(trap(0, 1) { -1 }, -1)
    assert_equal(trap(-1, -2) { -1 }, 1)
  end

  def test_correctness_lambda
    assert_equal(trap(0, 1, &(->(x) { 1 })), 1)
    assert_equal(trap(-0.5, -1.5, &(->(x) { 1 })), -1)
    assert_equal(trap(0, 1, &(->(x) { -1 })), -1)
    assert_equal(trap(-1, -2, &(->(x) { -1 })), 1)
  end
end
