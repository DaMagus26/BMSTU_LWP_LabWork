# frozen_string_literal: true

# Class documentation
class FibonacciSequence < Array
  include Enumerable

  def initialize(*args)
    super(*args)
    push(1.0)
    push(1.0)
  end

  def each_pair
    i = 1
    while i < length
      yield(fetch(i), fetch(i - 1))
      i += 1
    end
  end

  def clear
    super
    push(1.0)
    push(1.0)
  end
end

def calculate_golden_ratio(fib_seq, precision = 1e-3)
  gr = 1.618033989

  fib_seq.each_pair do |a, b|
    break if (a / b - gr).abs <= precision

    fib_seq.push(a + b)
  end

  fib_seq[-1] / fib_seq[-2]
end

