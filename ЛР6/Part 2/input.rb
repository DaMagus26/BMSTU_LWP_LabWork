# frozen_string_literal: true

require_relative 'main'

fib = FibonacciSequence.new
puts "For ζ = 1e-3: #{calculate_golden_ratio(fib, 1e-3)} :)"
fib.clear
puts "For ζ = 1e-4: #{calculate_golden_ratio(fib, 1e-4)} :)"
