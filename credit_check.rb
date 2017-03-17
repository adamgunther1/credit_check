puts "Please enter your credit card number:"
card_number = gets.chomp

summed_digits = []
valid = false

x = -1
until card_number[x] == nil
  digit = card_number[x].to_i
  if x.even?
    doubled_digit = digit * 2
      if doubled_digit > 9
        doubled_string = doubled_digit.to_s
        separated_digit_string_1 = doubled_string[0] 
        separated_digit_string_2 = doubled_string[1]
        separated_digit_summed = separated_digit_string_1.to_i + separated_digit_string_2.to_i
        summed_digits.insert(0, separated_digit_summed)
      else
        summed_digits.insert(0, doubled_digit)
      end
  else
    summed_digits.insert(0, digit)
  end
  x += -1
end

print summed_digits

 y = 0
 sum = 0
 until y == summed_digits.length
   sum += summed_digits[y]
   y += 1
  end


if sum % 10 == 0
  puts ""
  puts "The number is valid!"
else
  puts ""
  puts "The number is invalid!"
end