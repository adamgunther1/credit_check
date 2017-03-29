require 'pry'
require 'pry-state'

class CreditCheck
  attr_reader :card_number, :doubled_every_second,
          :reversed_number, :sum, :valid, :valid_string,
          :invalid_string

  def initialize(card_number)
    @card_number = card_number
    @reversed_number = ""
    @doubled_every_second = ""
    @sum = 0
    @valid = false
    @valid_string = "The number is valid!"
    @invalid_string = "The number is invalid!"
  end

  def reverse_number
    @reversed_number = card_number.to_s.reverse
  end

  def double_every_second_digit
    reverse_number
    i = 0
    until i == reversed_number.length
      if i.odd?
        doubled = reversed_number[i].to_i * 2
        if doubled >= 10
          two_digit_doubled = doubled.to_s 
          new_doubled = two_digit_doubled[0].to_i + two_digit_doubled[1].to_i
          @doubled_every_second << new_doubled.to_s
        else 
          @doubled_every_second << doubled.to_s
        end
      else 
        @doubled_every_second << reversed_number[i]
      end
      i += 1
    end
    @doubled_every_second
  end
  
  def sum_digits
    double_every_second_digit
    separated_digits = doubled_every_second.split("")
    separated_digits.each do |digit|
      @sum += digit.to_i
    end
    sum
  end

  def validation
    sum_digits
    @valid = true if sum % 10 == 0
  end

  def luhn_algorithm
    validation
    if @valid
      p @valid_string
    else
      p @invalid_string
    end
  end


end

cc = CreditCheck.new(5541)
p cc.double_every_second_digit