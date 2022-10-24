# frozen_string_literal: true

require_relative 'main'

puts trap(-1, 4, 100, &(->(x) { x + Math.cos(x) }))
puts trap(1, 2, 100) { |x| Math.tan(x + 1) / (x + 1) }
