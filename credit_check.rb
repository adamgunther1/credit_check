card_number = "4929735477250543"
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
        #print separated_digit_summed => insert into array instead
        summed_digits.insert(0, separated_digit_summed)
      else
        #print doubled_digit => insert into array instead
        summed_digits.insert(0, doubled_digit)
      end
  else
    #print digit => insert into array instead
    summed_digits.insert(0, digit)
  end
  x += -1
end

print summed_digits

sum = 0
total_sum = 0
y = 0
z = 1
until y == summed_digits.length
  sum = summed_digits[y] + summed_digits[z]
  total_sum += sum
  y += 2
  z += 2
 end

if total_sum % 10 == 0
  puts "The number is valid!"
else
  puts "The number is invalid!"
end