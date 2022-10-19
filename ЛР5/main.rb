module LW1Main
  def self.task1(x)
    return (1 - (1 + Math.sin(x).abs) ** 0.5) / (2 + Math.cos(x) ** 2)
  end

  def self.task2(arr)
    first_neg = arr.find_index { |x| x < 0 }

    if !first_neg || first_neg == 0 then
      return false
    end
    ascending = arr[0, first_neg].reduce([true, -Float::INFINITY]) { |ascending, x| [ascending[0] && ascending[1] <= x, x] }
    return ascending[0]
  end

  def self.task3(words, nums)
    words = words.split(' ')
    nums = nums.split(' ').map { |x| x.to_f }
    words.zip(nums).map { |w, l| (w.length > l) ? w.slice(0...l) : w }
  end
end