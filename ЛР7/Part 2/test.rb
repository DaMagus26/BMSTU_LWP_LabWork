# frozen_string_literal: true

require_relative 'main'
require 'minitest/autorun'

# Some docs
class TestHierarchy < Minitest::Test
  def setup
    super
    @person = Person.new('Alex', 20)
    @patient = Patient.new('William', 74, 2014)
  end

  def test_hierarchy
    assert_instance_of(Person, @person)
    assert_instance_of(Patient, @patient)
    refute_instance_of(Person, @patient)
    refute_instance_of(Patient, @person)

    assert(Patient < Person)
  end
end