# frozen_string_literal: true

require_relative 'main'
require 'minitest/autorun'

INPUT_PATH = '/Users/mikhail_ovakimyan/Documents/Универ/ЯИП/Исходники лаб/ЛР7/Part 1/text_files/input.txt'
OUTPUT_PATH = '/Users/mikhail_ovakimyan/Documents/Универ/ЯИП/Исходники лаб/ЛР7/Part 1/text_files/output.txt'

# Some excessive comments on that class
class TestRewriting < Minitest::Test
  def test_invalid_path
    assert_raises { rewrite_file }
  end

  def test_correct_work
    rewrite_file(INPUT_PATH, OUTPUT_PATH)
    assert(File.open(OUTPUT_PATH, 'r').readlines.all? { |str| str.start_with?(' ') })
  end
end
