require 'minitest/autorun'
require_relative 'main'
require_relative 'test_gen.rb'

class TastTask1 < Minitest::Test
  def test_wrong_input
    except1 = assert_raises() { LW1Main::task1 }
    except2 = assert_raises() { LW1Main::task1 'string' }
  end

  def test_cases
    cases = {
      0 => 0,
      Math::PI => 0,
      Math::PI / 2 => -0.2071067812
    }

    cases.each_pair { |test, ans| assert_in_delta(LW1Main::task1(test), ans, 1e-4) }
  end
end

class TestTask2 < Minitest::Test
  def test_cases
    cases = [
      [[1, 2, 3, 4, 5], false],
      [[-1, 2, 3, 4, 5], false],
      [[1, 2, 3, -4, 5], true],
      [[0, -1, -2, -3, -4], true]
    ]

    cases.each { |test, ans| assert_equal(LW1Main::task2(test), ans) }
  end
end

class TestTask3 < Minitest::Test
  def test_cases

    test_cases = gen_tests.map { |c| c[:input] }

    input = test_cases.map do |tc|
      {
        words: tc[0],
        raw_nums: tc[1],
      }
    end

    nums = test_cases.map do |tc|
      tc[1].split(' ').map { |x| x.to_i }
    end

    results = input.map { |tc| LW1Main::task3(tc[:words], tc[:raw_nums]) }

    data = results.map {|x| x.length }.zip(nums)

    data.each { |res, ans| assert_equal(res, ans) }
  end
end
