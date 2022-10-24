# frozen_string_literal: true

def trap(a, b, n = nil, &f)
  a = a.to_f
  b = b.to_f
  n = (n or (a - b).abs * 2).to_i
  return 0 if a == b

  sum = (1...n).sum(0) { |i| f.call(a + ((b - a) / n * i)) }

  ((b - a) / n) * ((f.call(a) + f.call(b)) / 2 + sum)
end

trap(0, 1) { 1 }