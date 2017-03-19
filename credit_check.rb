def credit_card_input
  puts "Please enter your credit card number:"
  card_number = gets.chomp
  return card_number
end

def luhn_algorithm(card_number)
  reverse_card_number = card_number.reverse
  separated_digits_reverse_card_number = reverse_card_number.each_char.to_a
  i = 0
  sum = 0
  summed_digits = []
  until separated_digits_reverse_card_number[i] == nil
    digit = separated_digits_reverse_card_number[i]
    if i.even?
      digit = digit.to_i
      summed_digits.insert(i, digit)
    else
      doubled_digit = digit.to_i * 2
      if doubled_digit.to_s.length > 1
        summed_digit = doubled_digit.to_s[0].to_i + doubled_digit.to_s[1].to_i
        summed_digits.insert(i, summed_digit)
      else
        summed_digits.insert(i, doubled_digit)
      end
    end
    sum += summed_digits[i]
    i += 1
  end 
  return sum  
end

def validation(sum)
  if sum % 10 == 0
    puts "The number is valid!"
  else
    puts "The number is invalid!"
  end
end

validation(luhn_algorithm(credit_card_input()))