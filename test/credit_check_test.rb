require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'

class CreditCheckTest < Minitest::Test

  def test_instance_exists
    cc = CreditCheck.new(5541808923795240)

    assert_instance_of CreditCheck, cc
  end

  def test_card_number_reverses
    cc = CreditCheck.new(5541808923795240)
    reversed_number = cc.reverse_number

    assert_equal "5541808923795240".reverse, reversed_number
  end

  def test_doubled_every_second_digit
    cc = CreditCheck.new(5541)
    doubled = cc.double_every_second_digit

    assert_equal "1851", doubled
  end

  def test_digits_sum
    cc = CreditCheck.new(42)
    sum = cc.sum_digits

    assert_equal 10, sum
  end

  def test_validation
    cc = CreditCheck.new(5541808923795240)
    valid = cc.validation

    assert valid
  end

  def test_output_of_validation
    cc = CreditCheck.new(5541808923795240)
    cc.luhn_algorithm

    assert_equal "The number is valid!", cc.luhn_algorithm
  end


end