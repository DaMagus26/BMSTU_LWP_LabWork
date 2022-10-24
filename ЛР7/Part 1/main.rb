# frozen_string_literal: true

def rewrite_file(input_path, output_path, reset = true)
  output_mode = reset ? 'w' : 'a'
  File.open(input_path, 'r') do |input|
    File.open(output_path, output_mode) do |output|
      while line = input.gets do
        output.puts " " + line
      end
    end
  end
end
