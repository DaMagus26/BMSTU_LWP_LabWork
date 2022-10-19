require_relative 'main'

def gen_tests(size = 10)
  cases = []
  10.times do
    sentence_len = rand(30).to_int
    max_num = rand(10).to_int
    test_words_arr = []
    answ_words_arr = []

    # Generate sequence of input numbers
    nums_arr = (0...sentence_len).map { rand(((max_num + 1) * 1.5).to_int) }
    # Generate the words, that fit given numbers
    nums_arr.each do |x|
      answ_word = (0...x).map { ('a'..'z').to_a[rand(26)] }.join('')

      if rand > 0.5 then
        # In 50% of cases given number will be greater than the entered word.
        test_words_arr.push(answ_word)
      else
        # In other cases given number will be equal or less than the entered word (word will be cut).
        test_words_arr.push(answ_word + (0...rand(10)).map { ('a'..'z').to_a[rand(26)] }.join(''))
      end

      answ_words_arr.push(answ_word)
    end
    words_input = test_words_arr.join(' ')
    nums_input = nums_arr.join(' ')

    cases.push({ input: [words_input, nums_input], output: answ_words_arr })
  end

  return cases
end

def print_cases(cases)
  cases.each do |c|
    puts("Words: #{c[:input][0]}")
    puts("Nums: #{c[:input][1]}")
    puts(c[:output].inspect, "\n")

  end
end
