# frozen_string_literal: true

# Some top level documentation for RuboCop
class Person
  def initialize(surname, age)
    @surname = surname
    @age = age
  end

  def show_info
    puts "Last name: #{@surname}"
    puts "Age: #{@age}"
  end
end

# Some top level documentation for RuboCop
class Patient < Person
  def initialize(surname, age, last_examination)
    super(surname, age)
    @last_examination = last_examination
  end

  def show_info
    super
    puts "Next medical examination in: #{[2022, @last_examination + 3].max}"
  end
end
