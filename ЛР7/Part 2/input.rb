# frozen_string_literal: true
require_relative 'main'

person = Person.new('Alex', 20)
patient = Patient.new('William', 74, 2014)

person.show_info
puts
patient.show_info
