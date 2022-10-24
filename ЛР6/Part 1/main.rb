# frozen_string_literal: true

def golden_ratio(precision=1e-3)
  a = 1.0
  b = 1.0
  gr = 1.618033989

  loop do
    a, b = a + b, a
    break if (gr - a / b).abs < precision
  end

  (a + b) / a
end
